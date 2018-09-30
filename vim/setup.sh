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

mkdir -p $HOME/.vim/bundle
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
