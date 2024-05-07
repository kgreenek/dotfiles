#!/bin/bash
set -e
if [[ -d $HOME/src/ryanoasis/nerd-fonts ]]; then
  echo "INFO: nerd fonts already cloned. Skipping..."
else
  echo "INFO: Cloning nerd-fonts to $HOME/src/ryanoasis/nerd-fonts (this may take a while)..."
  mkdir -p "$HOME/src/ryanoasis"
  cd "$HOME/src/ryanoasis"
  # Checkout an older release for now as the neovim ecosystem catches up to v3+.
  git clone -q -b 'v2.3.3' --single-branch --depth=1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh
fi
