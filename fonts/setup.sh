#!/bin/bash
set -e
if [[ -d $HOME/src/powerline/fonts ]]; then
  echo "Powerline fonts already cloned. Not installing..."
else
  mkdir -p $HOME/src/powerline
  cd $HOME/src/powerline
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
fi
