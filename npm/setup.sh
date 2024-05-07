#!/bin/bash

# Install nodejs and npm via mise.
if [ -f "${HOME}/.local/bin/mise" ]; then
  echo "INFO: mise already installed. Skipping..."
else
  curl https://mise.run | sh
  "${HOME}/.local/bin/mise" use --global node@latest
fi

# Ensure mise is avaialable if this is the first time setting up mise.
export PATH="${HOME}/.local/share/mise/shims:$PATH"

npm install --global yarn
npm install --no-fund --global neovim
