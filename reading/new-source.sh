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
    docker pull $DOCKER_IMAGE
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

TITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+title =" | cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
[[ "" != "$TITLE" ]] || printexit 1 "Could not extract a title citation from $BIBTEX_CITATION"
SHORTTITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+shorttitle =" | cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
if [[ "" != $SHORTTITLE ]] && (( 40 < $(echo $TITLE | wc -c) )); then
    FILE=$SUBDIR/$(echo $SHORTTITLE | tr -cd '[:alnum:]._-').md
else
    FILE=$SUBDIR/$(echo $TITLE | tr -cd '[:alnum:]._-').md
fi

##################################################################### VERIFICATION

printf "Fetched data for resource titled:\n  \"$TITLE\"\n"
read -r -p "Is this correct? [y/N] " response
[[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] || printexit 1 "Sorry."

##################################################################### CREATE FILE
echo "Creating file $FILE."
[[ ! -f $FILE ]] || printexit 1 "File $FILE already exists!"

if [[ ! $(echo $BIBTEX_CITATION | grep "author =") ]]; then
    TIP_ADD_AUTHOR="% To add author, insert: author = {Last, First},"
fi
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
