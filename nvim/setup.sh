#!/bin/bash
set -e

dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

mkdir -p "$HOME/.config/nvim"
if [[ -f "$HOME/.config/nvim/init.vim" && ! -L "$HOME/.config/nvim/init.vim" ]]; then
  echo "WARNING: $HOME/.config/nvim/init.vim already exists. Skipping..."
else
  if [[ -L "$HOME/.config/nvim/init.vim" ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.config/nvim/init.vim"
  fi
  ln -sf "$dir/init.vim" "$HOME/.config/nvim/init.vim"
fi
