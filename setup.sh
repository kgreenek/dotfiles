#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]
  then echo "Do NOT run as root!!! Aborting..."
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "--Setting up ~/.bashrc"
$DIR/bash/setup.sh

echo "--Setting up ~/.vimrc"
if [[ -f $HOME/.vimrc && ! -L $HOME/.vimrc ]]; then
  echo "WARNING: $HOME/.vimrc already exists. Skipping..."
else
  if [[ -L $HOME/.vimrc ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.vimrc"
  fi
  ln -sf $DIR/.vimrc $HOME/.vimrc
fi

echo "--Setting up ranger"
$DIR/ranger/setup.sh

echo "--Setting up tilix"
$DIR/tilix/setup.sh

echo "SUCCESS!"
