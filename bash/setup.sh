#!/bin/bash
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# Add line to source ./bashrc if it doesn't already exist in .bashrc.
line="source $dir/bashrc"
file="$HOME/.bashrc"
grep -qF -- "$line" "$file" || echo "$line" >> "$file"
