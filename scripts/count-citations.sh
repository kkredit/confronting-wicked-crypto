#!/bin/bash

cd $(git rev-parse --show-toplevel)
source ./scripts/sourceme.sh
# set -x

function grep_tex() {
    grep --color=auto -rniP --include \*.tex --exclude Thesis-Glossary.tex "$1" .
}

function grep_citation() {
    grep_tex "\\\\cite{$1}"
}

function grep_term() {
    grep_tex "\\\\ac[slfp]?{$1}"
}

function print_number_in_tex() {
    echo $((grep_citation $1 || grep_term $1) | wc -l)
}

function print_number_in_argdown() {
    echo $(grep "(cite:${1/_/\\\\_})" arguments/*.ad | wc -l)
}

function print_colored_number() {
    (( $1 > 0 )) && COLOR=$LIGHT_GREEN || COLOR=$YELLOW
    printf "$COLOR$1$NO_COLOR"
}

function pluralize() {
    (( $1 != 1 )) && printf s
}

function print_count() {
    COUNT_TEX=$(print_number_in_tex $1)
    COUNT_ARGDOWN=$(print_number_in_argdown $1)
    printf "$LIGHT_CYAN$1$NO_COLOR is cited $(print_colored_number $COUNT_TEX) time$(pluralize $COUNT_TEX) in writing"
    printf " and $(print_colored_number $COUNT_ARGDOWN) time$(pluralize $COUNT_ARGDOWN) in arguments.\n"
}

if (( 2 <= $# )) && [[ "-c" == "$1" ]]; then
    # Print count
    print_count $2
elif (( 2 <= $# )) && [[ "-n" == "$1" ]]; then
    # Print number only
    echo $(( $(print_number_in_tex $2) + $(print_number_in_argdown $2) ))
else
    print_count $1
    echo
    grep_citation $1 || grep_term $1
    grep --color=auto -rni --include \*.ad "(cite:${1/_/\\\\_})" .
fi
