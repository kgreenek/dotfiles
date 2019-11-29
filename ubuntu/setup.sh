#!/bin/bash
set -e

sudo apt-get update

# caca-utils gives us the img2txt binary so ranger can generate ascii image previews.
# highlight enables syntax highlighting in ranger previews.
# vim-gtk enables using the system clipboard from within vim.
sudo apt-get install -y \
  build-essential \
  caca-utils \
  ccache \
  cmake \
  conky-all \
  curl \
  git \
  highlight \
  htop \
  ranger \
  tilix \
  time \
  vim \
  vim-gtk \
