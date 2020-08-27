#!/bin/bash

set -eEuo pipefail

source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
cd $BASE_DIR

function get_ref_from_citation {
  grep "bibcite{$1}" build/Thesis.aux | cut -d'{' -f3 | cut -d'}' -f1
}

function get_citations_in_file {
  grep -o "(cite:[a-zA-Z_0-9\\]*)" $1 | tr -d ")\\\\" | cut -d: -f2 | uniq
}

function parse_infile_to_outfile {
  # Process citations
  # echo "IN: $1; OUT: $2"
  cp $1 $2
  # echo $(get_citations_in_file $1)
  for CITE in $(get_citations_in_file $1); do
    local FULL_CITE="(cite:${CITE/_/\\\\_})"
    local REF="$(get_ref_from_citation $CITE)"
    [[ "" == "$REF" ]] && exitprint 1 "${RED}Bibtex citation for $CITE not found$NO_COLOR"
    # echo "CITE: $CITE; REF: $REF"
    sed -i "s/$FULL_CITE/\\\\[$REF\\\\]/g" $2
  done

  # Remove preview configs
  if grep -q "Preview configs start" $2 && grep -q "Preview configs end" $2; then
    START_LINE=$(grep -n "Preview configs start" $2 | cut -d: -f1)
    END_LINE=$(grep -n "Preview configs end" $2 | cut -d: -f1)
    echo "Cutting $START_LINE to $END_LINE of $2"
    sed -i ${START_LINE},${END_LINE}d $2
  fi
}

mkdir -p arguments/build/w_citations

FILES=${@:-$(cd arguments; ls *.ad)}
for ARG_FILE in $FILES; do
  parse_infile_to_outfile arguments/$ARG_FILE arguments/build/w_citations/$ARG_FILE
done
