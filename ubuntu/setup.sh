#!/bin/bash
set -e

echo "INFO: Updating apt sources (may take a while)..."
sudo apt-get -qq update

if [[ ! -f "/etc/apt/apt.conf.d/20apt-esm-hook.conf.bak" ]]; then
  # Disable the annoying message that Ubuntu prints to try to get you to sign up for their
  # "Pro" subscription service.
  echo "INFO: Disabling Ubuntu ESM message on apt upgrade..."
  sudo dpkg-divert --divert /etc/apt/apt.conf.d/20apt-esm-hook.conf.bak \
    --rename --local /etc/apt/apt.conf.d/20apt-esm-hook.conf
fi

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
  ffmpegthumbnailer \
  git \
  highlight \
  htop \
  jq \
  lm-sensors \
  neofetch \
  ninja-build \
  python3-dev \
  python3-pip \
  tilix \
  time \
  unar \
  vim-gtk \
  xsel \
  yamllint \
  zsh

# Install chrome
if [ -n "$(dpkg -s google-chrome-stable)" ]; then
  echo "INFO: Chrome already installed. Skipping..."
else
  echo "INFO: Installing chrome from PPA..."
  curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y google-chrome-stable
fi

# Install signal
if [ -n "$(dpkg -s signal-desktop)" ]; then
  echo "INFO: Signal already installed. Skipping..."
else
  echo "INFO: Installing signal from PPA..."
  curl -fsSL https://updates.signal.org/desktop/apt/keys.asc | sudo gpg --dearmor -o /usr/share/keyrings/signal-desktop-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main" | sudo tee /etc/apt/sources.list.d/signal-xenial.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y signal-desktop
fi

# Install docker
if [ -n "$(dpkg -s docker-ce)" ]; then
  echo "INFO: Docker already installed. Skipping..."
else
  echo "INFO: Installing docker from PPA..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" |
    sudo tee /etc/apt/sources.list.d/docker.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y docker-ce docker-ce-cli containerd.io

  echo "INFO: Creating docker group and adding current user"
  if [ -z "$(getent group docker)" ]; then
    sudo groupadd docker
  fi
  sudo usermod -aG docker "${USER}"
fi

# Install bazel via apt just for up-to-date bash completions. We manage bazel using bazelisk.
if [ -n "$(dpkg -s bazel)" ]; then
  echo "INFO: Bazel apt package already installed. Skipping..."
else
  echo "INFO: Installing bazel from PPA..."
  curl -fsSL https://bazel.build/bazel-release.pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/bazel-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y bazel
fi
