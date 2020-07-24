#!/bin/bash

# set -eEuox pipefail

source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
cd $BASE_DIR

function get_ref_from_citation {
  grep "bibcite{$1}" build/Thesis.aux | cut -d'{' -f3 | cut -d'}' -f1
}

function get_full_citations_in_file {
  grep -o "{cite: [a-zA-Z_0-9]*}" $1 | uniq | sed 's/ /+/'
}

function get_stripped_citation {
  echo $1 | cut -d'+' -f2 | cut -d'}' -f1
}

function parse_infile_to_outfile {
  # echo "IN: $1; OUT: $2"
  cp $1 $2
  for CITE in $(get_full_citations_in_file $1); do
    local PLAIN_CITE="$(get_stripped_citation $CITE)"
    local ACTUAL_CITE=${CITE/+/ }
    local REF="$(get_ref_from_citation $PLAIN_CITE)"
    [[ "" == "$REF" ]] && exitprint 1 "Citation for $ACTUAL_CITE not found"
    # echo "CITE: $PLAIN_CITE; REF: $REF"
    sed -i "s/$ACTUAL_CITE/\\\\[$REF\\\\]/g" $2
  done
}

mkdir -p arguments/w_citations
for ARG in $(cd arguments; ls *.argdown); do
  parse_infile_to_outfile arguments/$ARG arguments/citations/$ARG
done
