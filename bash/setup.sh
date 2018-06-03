#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add line to source ./bashrc if it doesn't already exist in .bashrc.
LINE="source $DIR/bashrc"
FILE=$HOME/.bashrc
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
