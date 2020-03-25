#!/bin/bash

source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
# set -x
ORIG_DIR=$(pwd)
cd $READING_DIR

if (( 2 <= $# )) && [[ "-a" == "$1" ]]; then
    # Show all
    eval "grep -riIsl \"${@:2}\""
    exit 0
elif [[ 1 == $# && -f $ORIG_DIR/$1 ]]; then
    # Show a file based on path
    FILE=$ORIG_DIR/$1
elif [[ 1 == $# ]] && $(grep -riIsq "@*{$1,"); then
    # Show a file based on bibtex ref
    FILE="$(grep -riIsl "@*{$1," . | head -1)"
    FILE="$(readlink -f "$FILE")"
else
    # Show the file with the most string matches
    FILE_W_NUM="$(grep -riIsc "$@" . | sort -t: -n -k2 | tail -1)"
    NUM="$(echo $FILE_W_NUM | cut -d: -f2)"
    if (( $NUM == 0 )); then
        echo "No matches"
        exit 1
    fi
    FILE="$(echo $FILE_W_NUM | cut -d: -f1)"
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
