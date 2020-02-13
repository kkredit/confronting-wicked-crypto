#!/bin/bash

##################################################################### SCRIPT SETUP
USAGE="
$0 SUBDIR SOURCE

SUBDIR - Directory under which to create the new notes file
SOURCE - The DOI or URL of the new material
"

ORIG_DIR=$(pwd)
pushd $(git rev-parse --show-toplevel)/reading &>/dev/null
function cleanup() {
    if [[ 2 == $? ]]; then
        printf "$USAGE"
    fi
    set +x
    popd &>/dev/null
}
trap cleanup EXIT

function printexit() {
    echo "${@:2}"
    exit $1
}

##################################################################### DEPENDENCIES
[[ 0 < $(which docker | wc -l) ]] || printexit 1 "Docker must be installed."
if [[ ! $(which getdoi) ]]; then
    echo "Installing scholarref tools..."
    git clone git://src.adamsgaard.dk/scholarref ../../scholarref &>/dev/null
    pushd ../../scholarref &>/dev/null
    sudo make install >/dev/null
    popd &>/dev/null
fi

##################################################################### ARGUMENTS
(( 2 <= $# )) || printexit 2 "Incorrect args"
case "$1" in
    /*) SUBDIR=$(echo $1 | sed 's:/*$::') ;;
    *)  SUBDIR=$ORIG_DIR/$(echo $1 | sed 's:/*$::') ;;
esac
[ -d $SUBDIR ] || printexit 2 "SUBDIR=$SUBDIR must exist"
SOURCE="${@:2}"

##################################################################### ZOTERO CONTAINER
DOCKER_IMAGE="zotero/translation-server"
DOCKER_PORT=1969
if [[ 0 == $(docker container ls | grep $DOCKER_IMAGE | wc -l) ]]; then
    echo "Launching Zotero container (30s)..."
    docker run -d -p $DOCKER_PORT:$DOCKER_PORT --rm $DOCKER_IMAGE >/dev/null
    sleep 30
fi

##################################################################### DATA FETCHING
FORMAT=bibtex
CURL_TIMEOUT=5

function bad_json() {
    [[ 0 == $# ]] || [[ $(echo $@ | grep -v "{") ]]
}

echo "Trying as a DOI..."
JSON=$(curl -m $CURL_TIMEOUT -d "$SOURCE" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/search 2>/dev/null)
if bad_json $JSON; then
    echo "Trying as a URL..."
    JSON=$(curl -m $CURL_TIMEOUT -d "$SOURCE" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/web 2>/dev/null)
fi
if bad_json $JSON; then
    echo "Trying to fetch the DOI..."
    DOI=$(getdoi "$SOURCE")
    echo "Trying as DOI $DOI..."
    JSON=$(curl -m $CURL_TIMEOUT -d "$DOI" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/search 2>/dev/null)
fi
if bad_json $JSON; then
    printexit 1 "Could not identify data source from $SOURCE"
fi
BIBTEX_CITATION=$(curl -v -d "$JSON" -H "Content-Type: application/json" \
                    "127.0.0.1:$DOCKER_PORT/export?format=$FORMAT" 2>/dev/null)
[[ "" != "$BIBTEX_CITATION" ]] || printexit 1 "Could not extract $FORMAT citation from $SOURCE"

# Remove empty lines
BIBTEX_CITATION="$(echo "$BIBTEX_CITATION" | sed '/^[[:space:]]*$/d')"

##################################################################### VERIFICATION
TITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+title =" | cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
[[ "" != "$TITLE" ]] || printexit 1 "Could not extract a title citation from $BIBTEX_CITATION"

echo "Fetched data for resource titled:"
echo "  \"$TITLE\""
read -r -p "Is this correct? [y/N] " response
[[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] || printexit 1 "Sorry."
echo

##################################################################### CHECK FILE EXISTS
FILE=$SUBDIR/$(echo $TITLE | tr -cd '[:alnum:]_-').md

SHORTTITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+shorttitle =" | \
                    cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
[[ "" != "$SHORTTITLE" ]] && SHORTFILE=$SUBDIR/$(echo $SHORTTITLE | tr -cd '[:alnum:]_-').md

if [[ "" != "$SHORTFILE" ]]; then
    printf "File will be named:\n  \"$FILE\"\n"
    printf "Also have shorter name:\n  \"$SHORTFILE\"\n"
    read -r -p "Prefer the short title? [y/N] " response
    [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] && FILE=$SHORTFILE
    echo
fi

[[ ! -f $FILE ]] || printexit 1 "File $FILE already exists!"

##################################################################### ADDITIONAL INFO
NEW_CITATION_NAME=false

function citation_missing_field() {
    [[ $(echo $BIBTEX_CITATION | grep -v "\s$1 =") ]]
}

function insert_bibtex_field() {
    LINE_1="$(echo -e "$BIBTEX_CITATION" | head -n 1)"
    LEN_REST=$(( $(echo "$BIBTEX_CITATION" | wc -l) - 1 ))
    LINE_REST="$(echo "$BIBTEX_CITATION" | tail -n $LEN_REST)"
    BIBTEX_CITATION="$(echo -e "$LINE_1\n$1\n$LINE_REST")"
}

if citation_missing_field "month"; then
    echo "Could not find month. Paste month in the format 'jan' or leave blank if NA"
    read -r -p "Month: " MONTH
    echo
    if [[ "" != "$MONTH" ]]; then
        CITE_MONTH="\tmonth = {$MONTH},"
        insert_bibtex_field "$CITE_MONTH"
    fi
fi

if citation_missing_field "year"; then
    echo "Could not find year. Paste year in the format YYYY"
    read -r -p "Year: " YEAR
    echo
    [[ "" == "$YEAR" ]] && printerr 1 "Cannot have empty year"
    CITE_YEAR="\tyear = {$YEAR},"
    insert_bibtex_field "$CITE_YEAR"
    NEW_CITATION_NAME=true
fi

if citation_missing_field "author"; then
    echo "Could not find author. Paste names till finished, then enter 'x'"
    AUTHORS="\tauthor = {"
    ISFIRST=true
    while true; do
        read -r -p "Author first name: " FNAME
        [[ "x" == "$FNAME" ]] && break
        $ISFIRST || AUTHORS+=" and "
        ISFIRST=false
        read -r -p "Author last name: " LNAME
        if [[ "" == "$LNAME" ]] && [[ "" == "$FNAME" ]]; then
            printerr 1 "Cannot have empty author name"
        elif [[ "" == "$LNAME" ]]; then
            AUTHORS+="$FNAME"
        elif [[ "" == "$FNAME" ]]; then
            AUTHORS+="$LNAME"
        else
            AUTHORS+="$LNAME, $FNAME"
        fi
    done
    echo
    AUTHORS+="},"
    insert_bibtex_field "$AUTHORS"
    NEW_CITATION_NAME=true
fi

if $NEW_CITATION_NAME; then
    CITATION_AUTHOR="$(echo "$BIBTEX_CITATION" | grep '\sauthor =' | \
                            cut -d' ' -f3 | tr -cd '[:alnum:]')"
    CITATION_YEAR="$(echo "$BIBTEX_CITATION" | grep '\syear =' | cut -d{ -f2 | cut -d} -f1)"
    [[ "" != "$CITATION_YEAR" ]] || CITATION_YEAR="$(echo "$BIBTEX_CITATION" | grep '\sdate =' | \
                                                        cut -d{ -f2 | cut -d} -f1 | cut -d- -f1)"
    UNDERSCORE="_"
    NEW_NAME="$(echo "$CITATION_AUTHOR$UNDERSCORE$CITATION_YEAR" | tr '[:upper:]' '[:lower:]')"
    CURRENT_NAME="$(echo "$BIBTEX_CITATION" | head -1 | cut -d{ -f2 | cut -d, -f1)"
    BIBTEX_CITATION="$(echo "$BIBTEX_CITATION" | sed "s|$CURRENT_NAME|$NEW_NAME|")"
fi

##################################################################### CREATE FILE
FOLD_COL=120
FORMATTED_CITATION="$(echo "$TIP_ADD_AUTHOR$BIBTEX_CITATION" | \
                        sed '/^$/d' | sed 's/\t/  /' | fold -s -w $FOLD_COL - | sed 's/ *$//g')"

cat > $FILE <<EOF
# $TITLE

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

\`\`\`bib
$FORMATTED_CITATION
\`\`\`
EOF

##################################################################### WARNINGS
if [[ $(echo $FORMATTED_CITATION | grep "{http" | grep -v "}") ]]; then
    echo "WARNING: may have cut-off URL in citation"
fi

REF_NAME="$(echo "$FORMATTED_CITATION" | head -1 | cut -d{ -f2 | cut -d, -f1)"
if [[ $(cat ../Thesis.bib | grep $REF_NAME) ]]; then
    echo "WARNING: possible citation name collision using \"$REF_NAME\""
fi

##################################################################### FINAL STEPS
echo "Created file $FILE"
git add $FILE
codium $FILE
../scripts/bib-gen.sh
