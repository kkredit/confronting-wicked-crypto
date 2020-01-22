#!/bin/bash

##################################################################### SCRIPT SETUP
USAGE="
$0 SUBDIR SOURCE

SUBDIR - Directory under which to create the new notes file
SOURCE - The DOI or URL of the new material
"

pushd $(git rev-parse --show-toplevel)/Reading &>/dev/null
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
# while getopts "hv" arg; do
#   case $arg in
#     h) printexit 2 "Usage:" ;;
#     v) set -x ;;
#   esac
# done

(( 2 <= $# )) || printexit 2 "Incorrect args"
SUBDIR=${1/\//}
[ -d $SUBDIR ] || printexit 2 "SUBDIR=$SUBDIR must exist"
SOURCE="${@:2}"

##################################################################### ZOTERO CONTAINER
DOCKER_IMAGE="zotero/translation-server"
DOCKER_PORT=1969
if [[ 0 == $(docker container ls | grep $DOCKER_IMAGE | wc -l) ]]; then
    docker run -d -p $DOCKER_PORT:$DOCKER_PORT --rm $DOCKER_IMAGE
    sleep 15
fi

##################################################################### DATA FETCHING
FORMAT=bibtex

JSON=$(curl -v -d "$SOURCE" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/search 2>/dev/null)
if [[ 0 != $? || "Bad Request" == "$JSON" || "No identifiers found" == "$JSON" ]]; then
    JSON=$(curl -v -d "$SOURCE" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/web 2>/dev/null)
fi
if [[ "" == "$JSON" || "Remote page not found" == "$JSON" || "URL not provided" == "$JSON" ]]; then
    DOI=$(getdoi "$SOURCE")
    JSON=$(curl -v -d "$DOI" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/search 2>/dev/null)
fi
if [[ "" == "$JSON" || "No identifiers found" == "$JSON" ]]; then
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

printf "Fetched data for resource titled:\n  \"$TITLE\"\n"
read -r -p "Is this correct? [y/N] " response
[[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] || printexit 1 "Sorry."

##################################################################### CHECK FILE EXISTS
SHORTTITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+shorttitle =" | \
                    cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
if [[ "" != $SHORTTITLE ]] && (( 40 < $(echo $TITLE | wc -c) )); then
    FILE=$SUBDIR/$(echo $SHORTTITLE | tr -cd '[:alnum:]._-').md
else
    FILE=$SUBDIR/$(echo $TITLE | tr -cd '[:alnum:]._-').md
fi

echo "Creating file $FILE."
[[ ! -f $FILE ]] || printexit 1 "File $FILE already exists!"

##################################################################### ADDITIONAL INFO
NEW_CITATION_NAME=false

function insert_bibtex_field() {
    LINE_1="$(echo -e "$BIBTEX_CITATION" | head -n 1)"
    LEN_REST=$(( $(echo "$BIBTEX_CITATION" | wc -l) - 1 ))
    LINE_REST="$(echo "$BIBTEX_CITATION" | tail -n $LEN_REST)"
    BIBTEX_CITATION="$(echo -e "$LINE_1\n$1\n$LINE_REST")"
}

if [[ $(echo $BIBTEX_CITATION | grep -v "\sdate =") ]]; then
    echo "Could not find date. Paste date in formay 'YYYY-MM-DD'"
    read -r -p "Date: " DATE
    CITE_DATE="\tdate = {$DATE},"
    insert_bibtex_field "$CITE_DATE"
    NEW_CITATION_NAME=true
fi

if [[ $(echo $BIBTEX_CITATION | grep -v "\sauthor =") ]]; then
    echo "Could not find author. Paste names till finished, then enter 'x'"
    AUTHORS="\tauthor = {"
    ISFIRST=true
    while true; do
        read -r -p "Author first name: " FNAME
        [[ "x" == "$FNAME" ]] && break
        read -r -p "Author last name: " LNAME
        [[ "x" == "$LNAME" ]] && break
        $ISFIRST || AUTHORS+=" and "
        AUTHORS+="$LNAME, $FNAME"
    done
    AUTHORS+="},"
    insert_bibtex_field "$AUTHORS"
    NEW_CITATION_NAME=true
fi

if $NEW_CITATION_NAME; then
    CITATION_AUTHOR="$(echo "$BIBTEX_CITATION" | grep '\sauthor =' | cut -d{ -f2 | cut -d, -f1)"
    CITATION_YEAR="$(echo "$BIBTEX_CITATION" | grep '\sdate =' | \
                        cut -d{ -f2 | cut -d} -f1 | cut -d- -f1)"
    UNDERSCORE="_"
    NEW_NAME="$(echo "$CITATION_AUTHOR$UNDERSCORE$CITATION_YEAR" | tr '[:upper:]' '[:lower:]')"
    CURRENT_NAME="$(echo "$BIBTEX_CITATION" | head -1 | cut -d{ -f2 | cut -d, -f1)"
    BIBTEX_CITATION="$(echo "$BIBTEX_CITATION" | sed "s/$CURRENT_NAME/$NEW_NAME/")"
fi

##################################################################### CREATE FILE
FORMATTED_CITATION="$(echo "$TIP_ADD_AUTHOR$BIBTEX_CITATION" | \
                        sed '/^$/d' | sed 's/\t/  /' | fold -s -w 100 - | sed 's/ *$//g')"

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

git add $FILE
codium $FILE
./bib-gen.sh
