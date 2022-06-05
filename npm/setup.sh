#!/bin/bash

# Install nodejs and npm via nvm.
if [ -d "${HOME}/.nvm" ]; then
  echo "INFO: nvm / nodejs already installed. Skipping..."
else
  echo "INFO: Installing nvm..."
  # Set PROFILE explicitly to prevent it from adding lines to our bashrc.
  # We do that ourselves in sh_common/rc.
  curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | PROFILE='/dev/null' bash

  echo "INFO: Installing nodejs..."
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  echo "yarn" > "${NVM_DIR}/default-packages"
  nvm install node
  nvm use node
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
npm install --no-fund --global neovim
