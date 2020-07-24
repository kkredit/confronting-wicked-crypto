#!/bin/bash

cd $(git rev-parse --show-toplevel)
source ./scripts/sourceme.sh
# set -x

function print_number_in_tex() {
    echo $(grep "{$1}" *.tex | wc -l)
}

function print_number_in_argdown() {
    echo $(grep "cite_$1" arguments/*.argdown | wc -l)
}

function print_count() {
    COUNT_TEX=$(print_number_in_tex $1)
    COUNT_ARGDOWN=$(print_number_in_argdown $1)
    printf "$LIGHT_CYAN$1$NO_COLOR is cited $LIGHT_GREEN$COUNT_TEX$NO_COLOR time$(((1 == COUNT_TEX)) || echo s) in writing"
    printf " and $LIGHT_GREEN$COUNT_ARGDOWN$NO_COLOR time$(((1 == COUNT_ARGDOWN)) || echo s) in arguments.\n"
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
    grep --color=auto -n "\\\\cite{$1}" *.tex
    grep --color=auto -n "#cite_$1" arguments/*.argdown
fi
