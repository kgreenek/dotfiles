#!/bin/bash
set -e

if [[ -d "${HOME}/.cargo" ]]; then
  echo "INFO: rustup already installed. Skipping..."
else
  echo "INFO: Installing rustup and cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

PATH="${PATH}:${HOME}/.cargo/bin"

rustup component add rustfmt

if ! [ -x "$(command -v diskonaut)" ]; then
  echo "INFO: Installing diskonaut..."
  cargo install --quiet diskonaut
else
  echo "INFO: disonaut already installed. Skipping..."
fi

if ! [ -x "$(command -v dust)" ]; then
  echo "INFO: Installing dust..."
  cargo install --quiet du-dust
else
  echo "INFO: dust already installed. Skipping..."
fi

if ! [ -x "$(command -v fd)" ]; then
  echo "INFO: Installing fd..."
  cargo install --quiet fd-find
else
  echo "INFO: fd already installed. Skipping..."
fi

if ! [ -x "$(command -v lsd)" ]; then
  echo "INFO: Installing lsd..."
  cargo install --quiet lsd
else
  echo "INFO: lsd already installed. Skipping..."
fi

if ! [ -x "$(command -v rg)" ]; then
  echo "INFO: Installing ripgrep..."
  cargo install --quiet ripgrep
else
  echo "INFO: ripgrep already installed. Skipping..."
fi

if ! [ -x "$(command -v sd)" ]; then
  echo "INFO: Installing sd..."
  cargo install --quiet sd
else
  echo "INFO: sd already installed. Skipping..."
fi
