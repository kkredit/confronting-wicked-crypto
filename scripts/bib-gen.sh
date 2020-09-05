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

function sanitize_language_field() {
  if [[ "$REF" =~ "language" ]]; then
    for PATTERN in "n" "ng" "nglish" "n_GB" "n_US" "n\\\\_GB" "n\\\\_US" "n-GB" "n-US" "n-us"; do
      REF=${REF/\{[Ee]$PATTERN\}/\{english\}}
    done
  fi
}

echo "% This is an auto-generated bibliography file built by $(basename $0)" > $OUTFILE
echo >> $OUTFILE

for FILE in $(find . -type f -name "*.md"); do
  ROWS=( $(grep -n '```' $FILE | cut -d: -f1) )
  REF="$(sed -n $(( ${ROWS[0]} + 1 )),$(( ${ROWS[1]} - 1 ))p $FILE)"
  check_for_duplicate_refname
  sanitize_language_field
  echo "$REF" >> $OUTFILE
done
