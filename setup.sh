#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]
  then echo "Do NOT run as root!!! Aborting..."
  exit 1
fi

dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# So we can find our user-installed version of pip3 on the first run.
export PATH="~/.local/bin:$PATH"


echo "--Creating dirs"
mkdir -p ~/bin
mkdir -p ~/src

echo "--Installing Ubuntu system packages"
$dir/ubuntu/setup.sh

echo "--Installing pip user packages"
$dir/pip/setup.sh

echo "--Installing rust and cargo packages"
$dir/rust/setup.sh

echo "--Installing fzf"
$dir/fzf/setup.sh

echo "--Installing fonts"
$dir/fonts/setup.sh

echo "--Setting up zsh config"
$dir/zsh/setup.sh

echo "--Setting up bash config"
$dir/bash/setup.sh

echo "--Setting up vim config"
$dir/vim/setup.sh

echo "--Setting up ranger config"
$dir/ranger/setup.sh

echo "--Setting up tilix config"
$dir/tilix/setup.sh

echo ""
echo "SUCCESS!"
echo ""

echo "* Install conky config by running ./conky/setup.sh"
echo "* Set tilix as default terminal emulator on Ubuntu with the following command:"
echo "    sudo update-alternatives --config x-terminal-emulator"
