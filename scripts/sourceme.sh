# Source this file

export READING_DIR="$(git rev-parse --show-toplevel)/reading"
export SCRIPTS_DIR="$(git rev-parse --show-toplevel)/scripts"

export YELLOW='\e[0;33m'
export LIGHT_GREEN='\e[1;32m'
export LIGHT_CYAN='\e[1;36m'
export BLUE='\e[0;34m'
export NO_COLOR='\e[0m'

function exitprint() {
    echo "${@:2}"
    exit $1
}
export -f exitprint

alias new="$SCRIPTS_DIR/new-source.sh"
alias show="$SCRIPTS_DIR/show-source.sh"
alias gen="$SCRIPTS_DIR/bib-gen.sh"
alias cite="$SCRIPTS_DIR/count-citations.sh"
