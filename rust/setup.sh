#!/bin/bash
set -e

if [[ -d "${HOME}/.cargo" ]]; then
  echo "INFO: Rust already installed. Skipping..."
else
  echo "INFO: Installing rustup and cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

PATH="${PATH}:${HOME}/.cargo/bin"

if ! [ -x "$(command -v fd)" ]; then
  echo "INFO: Installing fd..."
  cargo install fd-find
else
  echo "INFO: fd already installed. Skipping..."
fi

if ! [ -x "$(command -v lsd)" ]; then
  echo "INFO: Installing lsd..."
  cargo install lsd
else
  echo "INFO: lsd already installed. Skipping..."
fi

if ! [ -x "$(command -v rg)" ]; then
  echo "INFO: Installing ripgrep..."
  cargo install ripgrep
else
  echo "INFO: ripgrep already installed. Skipping..."
fi
