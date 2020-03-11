#!/bin/bash

set -eEuo pipefail
source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
cd $READING_DIR

OUTFILE="../Thesis.bib"

function check_for_duplicate_refname() {
  local REFNAME="$(echo "$REF" | grep ^@ | cut -d{ -f2 | cut -d, -f1)"
  if cat $OUTFILE | grep -q "$REFNAME"; then
    echo "Duplicate reference name: $REFNAME"
    exit 1
  fi
}

echo "% This is an auto-generated bibliography file built by $(basename $0)" > $OUTFILE
echo "" >> $OUTFILE

for FILE in $(find . -type f -name "*.md"); do
  ROWS=( $(grep -n '```' $FILE | cut -d: -f1) )
  REF="$(sed -n $(( ${ROWS[0]} + 1 )),$(( ${ROWS[1]} - 1 ))p $FILE)"
  check_for_duplicate_refname
  echo "$REF" >> $OUTFILE
  echo >> $OUTFILE
done
