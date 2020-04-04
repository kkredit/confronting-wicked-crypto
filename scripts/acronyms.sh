#!/bin/bash

set -eEuo pipefail
source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
# set -x

INFILE="$BASE_DIR/notes/glossary.md"

function lineof_with_offset() {
  echo $(( $(grep -n "$1" $INFILE | cut -d: -f1) + $2 ))
}

function cat_acronym_table() {
  START_LINE=$(lineof_with_offset "<!-- start acronyms" 4)
  END_LINE=$(lineof_with_offset "<!-- end acronyms" -2)

  sed -n ${START_LINE},${END_LINE}p $INFILE
}

function to_lower() {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}

function convert_to_latex() {
  TERM="$(echo $1 | cut -d\| -f 2 | sed 's/[[:blank:]]*$//' | sed 's/^[[:blank:]]*//')"
  DEFN="$(echo $1 | cut -d\| -f 3 | sed 's/[[:blank:]]*$//' | sed 's/^[[:blank:]]*//')"

  echo "\newabbreviation{$TERM}{$TERM}{$DEFN}"
}

while read -r ACR; do
    convert_to_latex "$ACR"
done <<< $(cat_acronym_table)
