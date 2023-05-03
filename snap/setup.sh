#!/bin/bash
sudo snap install btop
sudo snap install discord
sudo snap install jsonnet
sudo snap install shellcheck
sudo snap install yq

sudo snap install --classic go
sudo snap install --classic slack
# We need at least v0.8, which is newer than even the neovim PPA.
sudo snap install --edge --classic nvim
