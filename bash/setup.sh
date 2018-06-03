#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add line to source bash/init.sh if it doesn't already exist in .bashrc.
LINE="source $DIR/init.sh"
FILE=$HOME/.bashrc
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
