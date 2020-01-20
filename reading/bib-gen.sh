#!/bin/bash

pushd $(dirname $0) &>/dev/null
function cleanup() {
  popd &>/dev/null
}
trap cleanup EXIT

OUTFILE="../Thesis.bib"

echo "% This is an auto-generated bibliography file built by $0" > $OUTFILE
echo "" >> $OUTFILE

for FILE in $(find . -type f -name "*.md"); do
  ROWS=( $(grep -n '```' $FILE | cut -d: -f1) )
  sed -n $(( ${ROWS[0]} + 1 )),$(( ${ROWS[1]} - 1 ))p $FILE >> $OUTFILE
  echo >> $OUTFILE
done
