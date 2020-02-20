# Source this file

export READING_DIR="$(git rev-parse --show-toplevel)/reading"
export SCRIPTS_DIR="$(git rev-parse --show-toplevel)/scripts"

alias new="$SCRIPTS_DIR/new-source.sh"
alias show="$SCRIPTS_DIR/show-source.sh"
alias gen="$SCRIPTS_DIR/bib-gen.sh"
