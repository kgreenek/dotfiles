#!/bin/bash

# Install nodejs and npm via mise.
if [ -f "${HOME}/.local/bin/mise" ]; then
  echo "INFO: mise already installed. Skipping..."
else
  curl https://mise.run | sh
  eval "$("${HOME}/.local/bin/mise activate zsh")"
  "${HOME}/.local/bin/mise" use --global node@latest
fi

npm install --global yarn
npm install --no-fund --global neovim
