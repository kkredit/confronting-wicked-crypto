#!/bin/bash

set -eEuo pipefail

# shellcheck disable=SC1090
source "$(git rev-parse --show-toplevel)"/scripts/sourceme.sh
cd "$BASE_DIR"

function get_ref_from_citation {
  grep "bibcite{$1}" build/Thesis.aux | cut -d'{' -f3 | cut -d'}' -f1
}

function get_citations_in_file {
  grep -o "(cite:[a-zA-Z_0-9\\]*)" "$1" | tr -d ")\\\\" | cut -d: -f2 | uniq
}

# There are two methods of resolving citations.
# 1. Manually using the Thesis.aux file.
# 2. Automatically using TeX.

TEX=false
# TEX=true

function parse_infile_to_outfile {
  # Process citations
  # echo "IN: $1; OUT: $2"
  cp "$1" "$2"
  # echo $(get_citations_in_file $1)
  for CITE in $(get_citations_in_file "$1"); do
    local FULL_CITE="(cite:${CITE/_/\\\\_})"
    if ! $TEX; then
      local REF
      REF="$(get_ref_from_citation "$CITE")"
      if [[ "" == "$REF" ]]; then
          printf "%sBibtex citation for %s not found%s\n" "$RED" "$CITE" "$NO_COLOR"
          REF="E\\\\_AGAIN"
      fi
      # echo "CITE: $CITE; REF: $REF"
      sed -i "s/$FULL_CITE/\\\\[$REF\\\\]/g" "$2"
    else
      TEX_CITE="\\\\\\\\cite\\\\{${CITE/_/\\\\_}\\\\}"
      sed -i "s/$FULL_CITE/$TEX_CITE/g" "$2"
    fi
  done

  # Remove preview configs
  if grep -q "Preview configs start" "$2" && grep -q "Preview configs end" "$2"; then
    START_LINE=$(grep -n "Preview configs start" "$2" | cut -d: -f1)
    END_LINE=$(grep -n "Preview configs end" "$2" | cut -d: -f1)
    # echo "Cutting $START_LINE to $END_LINE of $2"
    sed -i "$START_LINE","$END_LINE"d "$2"
  fi
}

mkdir -p arguments/build/w_citations

FILES=${*:-$(cd arguments; ls ./*.ad)}
for ARG_FILE in $FILES; do
  parse_infile_to_outfile arguments/"$ARG_FILE" arguments/build/w_citations/"$ARG_FILE"
done
