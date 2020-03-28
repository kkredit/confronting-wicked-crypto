#!/bin/bash

cd $(git rev-parse --show-toplevel)
source ./scripts/sourceme.sh
# set -x

function print_number() {
    echo $(grep "\\cite{$1}" *.tex | wc -l)
}

function print_count() {
    COUNT=$(print_number $1)
    echo -e "$LIGHT_CYAN$1$NO_COLOR is cited $COUNT time$(((1 == COUNT)) || echo s)."
}

if (( 2 <= $# )) && [[ "-c" == "$1" ]]; then
    # Print count
    print_count $2
elif (( 2 <= $# )) && [[ "-n" == "$1" ]]; then
    # Print number only
    print_number $2
else
    print_count $1
    echo
    grep --color=auto -n "\\cite{$1}" *.tex
fi
