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
  lm-sensors \
  ninja-build \
  python-dev \
  python3-dev \
  python3-pip \
  shellcheck \
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

# Install signal
if [ ! -z "$(dpkg -s signal-desktop)" ]; then
  echo "INFO: Signal already installed. Skipping..."
else
  echo "INFO: Installing signal from PPA..."
  wget -q -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
  echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y signal-desktop
fi

# Install docker
if [ ! -z "$(dpkg -s docker-ce)" ]; then
  echo "INFO: Docker already installed. Skipping..."
else
  echo "INFO: Installing docker from PPA..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | sudo tee -a /etc/apt/sources.list.d/docker.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y docker-ce docker-ce-cli containerd.io

  echo "INFO: Creating docker group and adding current user"
  if [ -z "$(getent group docker)" ]; then
    sudo groupadd docker
  fi
  sudo usermod -aG docker "${USER}"
fi

# Install nodejs
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

sudo snap install \
  btop \
  nvim
