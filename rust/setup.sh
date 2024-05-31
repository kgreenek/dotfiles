#!/bin/bash
set -e

function cargo_install () {
  local package="$1"
  local bin="$2"
  if [[ "${bin}" == "" ]]; then
    bin="${package}"
  fi
  if ! [ -x "$(command -v "${bin}")" ]; then
    echo "INFO: Installing ${package}..."
    cargo install --quiet "${package}"
  else
    echo "INFO: ${package} already installed. Skipping..."
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
cargo_install du-dust dust
cargo_install fd-find fd
cargo_install lsd
cargo_install ripgrep rg
cargo_install sd
cargo_install stylua
cargo_install tree-sitter-cli tree-sitter
cargo_install yazi-fm yazi-cli
