#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit
# shellcheck disable=SC1091
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
    (grep_citation "$1" || grep_term "$1") | wc -l
}

function print_number_in_argdown() {
    # shellcheck disable=SC2126
    grep "(cite:${1/_/\\\\_})" arguments/*.ad | wc -l
}

function print_colored_number() {
    (( $1 > 0 )) && COLOR=$LIGHT_GREEN || COLOR=$YELLOW
    printf "$COLOR%s$NO_COLOR" "$1"
}

function pluralize() {
    (( $1 != 1 )) && printf s
}

function print_count() {
    COUNT_TEX=$(print_number_in_tex "$1")
    COUNT_ARGDOWN=$(print_number_in_argdown "$1")
    printf "$LIGHT_CYAN%s$NO_COLOR is cited $(print_colored_number "$COUNT_TEX") time$(pluralize "$COUNT_TEX") in writing" "$1"
    echo   " and $(print_colored_number "$COUNT_ARGDOWN") time$(pluralize "$COUNT_ARGDOWN") in arguments."
}

if (( 2 <= $# )) && [[ "-c" == "$1" ]]; then
    # Print count
    print_count "$2"
elif (( 2 <= $# )) && [[ "-n" == "$1" ]]; then
    # Print number only
    echo $(( $(print_number_in_tex "$2") + $(print_number_in_argdown "$2") ))
else
    print_count "$1"
    echo
    grep_citation "$1" || grep_term "$1"
    grep --color=auto -rni --include \*.ad "(cite:${1/_/\\\\_})" .
fi
