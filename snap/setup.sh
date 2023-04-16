#!/bin/bash
sudo snap install \
  btop \
  jsonnet \
  shellcheck

sudo snap install --classic discord
sudo snap install --classic go
sudo snap install --classic slack
sudo snap install --classic yq

# We need at least v0.8, which is newer than even the neovim PPA.
sudo snap install --edge --classic nvim
