# Source this file

export BASE_DIR="$(git rev-parse --show-toplevel)"
export READING_DIR="$BASE_DIR/reading"
export SCRIPTS_DIR="$BASE_DIR/scripts"

export RED='\e[1;31m'
export YELLOW='\e[0;33m'
export LIGHT_GREEN='\e[1;32m'
export LIGHT_CYAN='\e[1;36m'
export BLUE='\e[0;34m'
export NO_COLOR='\e[0m'

function exitprint() {
    echo -e "${@:2}"
    exit $1
}
export -f exitprint

alias new="$SCRIPTS_DIR/new-source.sh"
alias show="$SCRIPTS_DIR/show-source.sh"
alias term="$SCRIPTS_DIR/term.sh"
alias gen="$SCRIPTS_DIR/bib-gen.sh"
alias cite="$SCRIPTS_DIR/count-citations.sh"
alias todo="(cd $BASE_DIR && grep -nE '(TODO|FIXME)' *.tex)"
alias fixme="(cd $BASE_DIR && grep -nE 'FIXME' *.tex)"
alias pdf="xdg-open $BASE_DIR/build/Thesis.pdf"
alias gvsu="xdg-open $BASE_DIR/build/Thesis-GVSU.pdf"
alias start="(codium .) && (xdg-open build/Thesis.pdf) && make live"

function arg {
    xdg-open $BASE_DIR/arguments/build/$1.pdf 2>/dev/null \
        || xdg-open $BASE_DIR/arguments/build/comprehensive.$1.pdf 2>/dev/null
}

function notes {
    pushd $BASE_DIR/reading >/dev/null
    local FZF_PRV_SET="--layout=reverse --info=inline --border --preview-window=left:120:wrap"
    local FZF_PRV_CMD="$SCRIPTS_DIR/show-source.sh {} && printf '====================\n\n' && bat --plain --color=always {}"
    codium $(fzf $FZF_PRV_SET --preview="$FZF_PRV_CMD")
    popd >/dev/null
}
