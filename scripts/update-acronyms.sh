#!/bin/bash

set -eEuo pipefail
source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
#set -x

TEX_FILE="$BASE_DIR/Thesis-Glossary.tex"

function lineof_with_offset() {
  echo $(( $(grep -n "$1" $TEX_FILE | cut -d: -f1) + $2 ))
}

START_LINE=$(lineof_with_offset "% Start acronyms" 0)
END_LINE=$(lineof_with_offset "% End acronyms" 0)
EOF_LINE=$(wc -l $TEX_FILE | awk '{print $1}')

BEGINNING="$(sed -n 1,${START_LINE}p         $TEX_FILE)"
END="$(      sed -n ${END_LINE},${EOF_LINE}p $TEX_FILE)"

echo "$BEGINNING"         >  $TEX_FILE
$SCRIPTS_DIR/acronyms.sh  >> $TEX_FILE
echo "$END"               >> $TEX_FILE

