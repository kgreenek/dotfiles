#!/bin/bash
set -e
if [[ -d $HOME/src/ryanoasis/nerd-fonts ]]; then
  echo "INFO: Nerd fonts already cloned. Not installing..."
else
  mkdir -p $HOME/src/ryanoasis
  cd $HOME/src/ryanoasis
  git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
  cd nerd-fonts
  ./install.sh
fi
