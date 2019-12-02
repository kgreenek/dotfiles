#!/bin/bash
set -e

dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

if [[ -f $HOME/.vimrc && ! -L $HOME/.vimrc ]]; then
  echo "WARNING: $HOME/.vimrc already exists. Skipping..."
else
  if [[ -L $HOME/.vimrc ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.vimrc"
  fi
  ln -sf $dir/vimrc $HOME/.vimrc
fi
