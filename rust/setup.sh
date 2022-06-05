#!/bin/bash
set -e

function cargo_install () {
  local package="$1"
  if ! [ -x "$(command -v "$package")" ]; then
    echo "INFO: Installing $package..."
    cargo install --quiet "$package"
  else
    echo "INFO: $package already installed. Skipping..."
  fi
}

if [[ -d "${HOME}/.cargo" ]]; then
  echo "INFO: rustup already installed. Skipping..."
else
  echo "INFO: Installing rustup and cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

PATH="${PATH}:${HOME}/.cargo/bin"

rustup component add rustfmt

cargo_install bat
cargo_install diskonaut
cargo_install du-dust
cargo_install fd-find
cargo_install lsd
cargo_install ripgrep
cargo_install sd
cargo_install stylua
