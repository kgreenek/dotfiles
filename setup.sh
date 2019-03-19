#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]
  then echo "Do NOT run as root!!! Aborting..."
  exit 1
fi

dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

echo "--Creating dirs"
mkdir -p ~/bin
mkdir -p ~/src

echo "--Setting up zsh"
$dir/zsh/setup.sh

echo "--Setting up bash"
$dir/bash/setup.sh

echo "--Setting up vim"
$dir/vim/setup.sh

echo "--Setting up fonts"
$dir/fonts/setup.sh

echo "--Setting up ranger"
$dir/ranger/setup.sh

echo "--Setting up tilix"
$dir/tilix/setup.sh

echo "SUCCESS!"
