#!/bin/bash

cd $(git rev-parse --show-toplevel)
source ./scripts/sourceme.sh
# set -x

LIGHT_GREEN='\e[1;32m'
LIGHT_CYAN='\e[1;36m'
NO_COLOR='\e[0m'

function print_number() {
    echo $(grep $1 *.tex | wc -l)
}

function print_count() {
    COUNT=$(print_number $1)
    echo -e "$LIGHT_GREEN$1$NO_COLOR is cited $COUNT time$(((1 == COUNT)) || echo s)."
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
    grep --color=auto -n $1 *.tex
fi
