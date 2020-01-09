#!/bin/bash

##################################################################### SCRIPT SETUP
USAGE="
$0 SUBDIR SOURCE

SUBDIR - Directory under which to create the new notes file
SOURCE - The DOI or URL of the new material
"

pushd $(git rev-parse --show-toplevel)/Reading &>/dev/null
function cleanup() {
    if [[ 0 != $? ]]; then
        printf "$USAGE"
    fi
    popd &>/dev/null
}
trap cleanup EXIT

function printerr() {
    echo "$@"
    exit 1
}

##################################################################### ARGUMENTS
[[ 0 < $(which docker | wc -l) ]] || printerr "Docker must be installed."
[[ 2 == $# ]] || printerr "Incorrect args"
SUBDIR=${1/\//}
[ -d $SUBDIR ] || printerr "SUBDIR=$SUBDIR must exist"
SOURCE=$2

##################################################################### ZOTERO CONTAINER
DOCKER_IMAGE="zotero/translation-server"
DOCKER_PORT=1969
if [[ 0 == $(docker container ls | grep $DOCKER_IMAGE | wc -l) ]]; then
    docker pull $DOCKER_IMAGE
    docker run -d -p $DOCKER_PORT:$DOCKER_PORT --rm $DOCKER_IMAGE
    sleep 5
fi

##################################################################### DATA FETCHING
FORMAT=bibtex

JSON=$(curl -v -d "$SOURCE" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/search 2>/dev/null)
if [[ 0 != $? || "No identifiers found" == "$JSON" ]]; then
    JSON=$(curl -v -d "$SOURCE" -H "Content-Type: text/plain" \
                    127.0.0.1:$DOCKER_PORT/web 2>/dev/null)
fi
if [[ 0 != $? || "Remote page not found" == "$JSON" ]]; then
    printerr "Could not identify data source from $SOURCE"
fi
BIBTEX_CITATION=$(curl -v -d "$JSON" -H "Content-Type: application/json" \
                    "127.0.0.1:$DOCKER_PORT/export?format=$FORMAT" 2>/dev/null)
[[ 0 == $? ]] || printerr "Could not extract $FORMAT citation from $SOURCE"

TITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+title =" | cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
SHORTTITLE="$(echo "$BIBTEX_CITATION" | grep "\s\+shorttitle =" | cut -d{ -f 2- | cut -d, -f 1 | tr -d {})"
if [[ "" != $SHORTTITLE ]]; then
    FILE=$SUBDIR/$(echo $SHORTTITLE | tr -cd '[:alnum:]._-').md
else
    FILE=$SUBDIR/$(echo $TITLE | tr -cd '[:alnum:]._-').md
fi
[[ ! -f $FILE ]] || printerr "File $FILE already exists!"
echo "Fetched data for resource titled \"$TITLE\""

##################################################################### CREATE FILE
echo "Creating file $FILE."

if [[ ! $(echo $BIBTEX_CITATION | grep "author =") ]]; then
    TIP_ADD_AUTHOR="% To add author, insert: author = {Last, First},"
fi
FORMATTED_CITATION="$(echo "$TIP_ADD_AUTHOR$BIBTEX_CITATION" | \
                        sed '/^$/d' | sed 's/\t/  /' | fold -s -w 100 -)"

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

codium $FILE
