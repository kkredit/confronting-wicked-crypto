#!/bin/bash

set -eEuo pipefail

source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
cd $BASE_DIR

function get_ref_from_citation {
  grep "bibcite{$1}" build/Thesis.aux | cut -d'{' -f3 | cut -d'}' -f1
}

function get_full_citations_in_file {
  grep -o "#cite_[a-zA-Z_0-9]*" $1 | uniq
}

function parse_infile_to_outfile {
  # echo "IN: $1; OUT: $2"
  cp $1 $2
  for CITE in $(get_full_citations_in_file $1); do
    local PLAIN_CITE=${CITE/\#cite_/}
    # local ACTUAL_CITE=${CITE/+/ }
    local REF="$(get_ref_from_citation $PLAIN_CITE)"
    [[ "" == "$REF" ]] && exitprint 1 "Citation for $CITE ($PLAIN_CITE) not found"
    # echo "CITE: $PLAIN_CITE; REF: $REF"
    sed -i "s/$CITE/\\\\[$REF\\\\]/g" $2
  done
}

mkdir -p arguments/build/w_citations

FILES=${@:-$(cd arguments; ls *.argdown)}
for ARG_FILE in $FILES; do
  parse_infile_to_outfile arguments/$ARG_FILE arguments/build/w_citations/$ARG_FILE
done
