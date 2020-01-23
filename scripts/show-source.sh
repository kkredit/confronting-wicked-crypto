#!/bin/bash

FILE=$1
NAME="$(cat $FILE | head -1 | sed 's/# //')"
URL=$(cat $FILE | grep -A1 "\surl =" | tr '\n' ' ' | cut -d{ -f2 | cut -d} -f1)

echo
echo "$NAME"
echo
echo "  $URL"
echo
