#!/bin/bash
set -e

dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/lua"

if [[ -f "$HOME/.config/nvim/init.lua" && ! -L "$HOME/.config/nvim/init.lua" ]]; then
  echo "WARNING: $HOME/.config/nvim/init.lua already exists. Skipping..."
else
  if [[ -L "$HOME/.config/nvim/init.lua" ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.config/nvim/init.lua"
  fi
  ln -sf "$dir/init.lua" "$HOME/.config/nvim/init.lua"
fi

if [[ -f "$HOME/.config/nvim/stylua.toml" && ! -L "$HOME/.config/nvim/stylua.toml" ]]; then
  echo "WARNING: $HOME/.config/nvim/stylua.toml already exists. Skipping..."
else
  if [[ -L "$HOME/.config/nvim/stylua.toml" ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.config/nvim/stylua.toml"
  fi
  ln -sf "$dir/stylua.toml" "$HOME/.config/nvim/stylua.toml"
fi

if [[ -d "$HOME/.config/nvim/lua/kgreenek" && ! -L "$HOME/.config/nvim/lua/kgreenek" ]]; then
  echo "WARNING: $HOME/.config/nvim/lua/kgreenek already exists. Skipping..."
else
  if [[ -L "$HOME/.config/nvim/lua/kgreenek" ]]; then
    echo "INFO: Over-writing existing symlink $HOME/.config/nvim/lua/kgreenek"
  fi
  ln -sfn "$dir/lua/kgreenek" "$HOME/.config/nvim/lua/kgreenek"
fi
