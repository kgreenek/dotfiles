#!/bin/bash
set -e

sudo apt-get -qq update

# caca-utils gives us the img2txt binary so ranger can generate ascii image previews.
# highlight enables syntax highlighting in ranger previews.
# python3-dev is needed to compile the youcompleteme vim plugin.
# vim-gtk enables using the system clipboard from within vim.
sudo apt-get -qq install -y \
  build-essential \
  caca-utils \
  ccache \
  cmake \
  conky-all \
  curl \
  git \
  highlight \
  htop \
  nodejs \
  npm \
  python3-dev \
  python3-pip \
  tilix \
  time \
  vim \
  vim-gtk \
