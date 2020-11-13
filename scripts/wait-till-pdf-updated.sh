#!/bin/bash

PDF="$(git rev-parse --show-toplevel)"/build/Thesis.pdf

function getTs() {
    stat --format=%Y "$PDF" || echo 0
}

START_TS=$(getTs)
while [[ $START_TS == $(getTs) ]]; do
    sleep 1
done
