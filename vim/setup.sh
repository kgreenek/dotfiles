#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -f $HOME/.vimrc && ! -L $HOME/.vimrc ]]; then
  echo "WARNING: $HOME/.vimrc already exists. Skipping..."
else
  if [[ -L $HOME/.vimrc ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.vimrc"
  fi
  ln -sf $DIR/vimrc $HOME/.vimrc
fi
