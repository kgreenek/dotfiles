#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]
  then echo "Do NOT run as root!!! Aborting..."
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "--Creating dirs"
mkdir -p ~/bin

echo "--Setting up ~/.bashrc"
$DIR/bash/setup.sh

echo "--Setting up ~/.vimrc"
$DIR/vim/setup.sh

echo "--Setting up fonts"
$DIR/fonts/setup.sh

echo "--Setting up ranger"
$DIR/ranger/setup.sh

echo "--Setting up tilix"
$DIR/tilix/setup.sh

echo "SUCCESS!"
