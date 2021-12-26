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
  xsel \
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

# Install bazel via apt just for up-to-date bash completions. We manage bazel using bazelisk.
if [ ! -z "$(dpkg -s bazel)" ]; then
  echo "INFO: bazel apt package already installed. Skipping..."
else
  echo "INFO: Installing bazel from PPA..."
  curl -sL https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
  echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y bazel
fi
