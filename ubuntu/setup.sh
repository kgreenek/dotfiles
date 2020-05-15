#!/bin/bash
set -e

echo "INFO: Updating apt sources (may take a while)..."
sudo apt-get -qq update

# caca-utils gives us the img2txt binary so ranger can generate ascii image previews.
# highlight enables syntax highlighting in ranger previews.
# python-dev and python3-dev are needed to compile the youcompleteme vim plugin.
# vim-gtk enables using the system clipboard from within vim.
echo "INFO: Installing apt packages..."
sudo apt-get -qq install -y \
  build-essential \
  caca-utils \
  ccache \
  cmake \
  clang-format \
  conky-all \
  curl \
  git \
  highlight \
  htop \
  ninja-build \
  python-dev \
  python3-dev \
  python3-pip \
  tilix \
  time \
  vim-gtk \
  zsh \

# Install chrome
if [ ! -z "$(dpkg -s google-chrome-stable)" ]; then
  echo "INFO: Chrome already installed. Skipping..."
else
  echo "INFO: Installing chrome from PPA..."
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
  sudo apt-get -qq update
  sudo apt-get -qq install -y google-chrome-stable
fi
