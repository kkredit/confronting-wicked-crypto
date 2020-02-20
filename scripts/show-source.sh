#!/bin/bash

# set -x
ORIG_DIR=$(pwd)
cd $READING_DIR

if [[ 1 == $# && -f $ORIG_DIR/$1 ]]; then
    FILE=$ORIG_DIR/$1
else
    FILE="$(grep -riIsc "$@" . | sort -t: -n -k2 | tail -1 | cut -d: -f1)"
    FILE="$(readlink -f "$FILE")"
fi

if [[ ! -f "$FILE" ]]; then
    echo "Sorry, file \"$FILE\" not found."
    exit 1
fi

NAME="$(cat "$FILE" | head -1 | sed 's/# //')"
AUTHOR="$(cat "$FILE" | grep -A1 "\sauthor =" | tr '\n' ' ' | cut -d{ -f2 | cut -d} -f1)"
REF="$(cat "$FILE" | grep -A1 "\`bib" | tr '\n' ' ' | cut -d{ -f2 | cut -d, -f1)"
URL=$(cat "$FILE" | grep -A1 "\surl =" | tr '\n' ' ' | cut -d{ -f2 | cut -d} -f1)

YELLOW='\e[0;33m'
LIGHT_GREEN='\e[1;32m'
LIGHT_CYAN='\e[1;36m'
BLUE='\e[0;34m'
NO_COLOR='\e[0m'

echo
echo -e "$LIGHT_CYAN$NAME$NO_COLOR"
echo -e "by $YELLOW$AUTHOR$NO_COLOR"
echo
echo -e "$BLUE$URL$NO_COLOR"
echo -e "$FILE"
echo
echo -e "cite as $LIGHT_GREEN$REF$NO_COLOR"
echo
