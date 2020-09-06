#!/bin/bash

set -eEuo pipefail

source $(git rev-parse --show-toplevel)/scripts/sourceme.sh
cd $BASE_DIR

WHOLE="$(tr -d '\n' < Thesis-Glossary.tex | grep -iEo "newabbreviation{$1}{[^}]*}{[^}]*}" | tr -d '}')"
SHORT="$(echo $WHOLE | cut -d{ -f2)"
LONG="$(echo $WHOLE | cut -d{ -f3)"
DEF="$(echo $WHOLE | cut -d{ -f4)"

echo -e "$LIGHT_CYAN$LONG$NO_COLOR ($SHORT)"
echo -e "$LIGHT_GREEN$DEF$NO_COLOR"
