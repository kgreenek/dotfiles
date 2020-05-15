#!/bin/bash
set -e

# Install bazelisk
# NOTE: Only works on linux.
bazelisk_bin="${HOME}/bin/bazel"
bazelisk_url="https://github.com/bazelbuild/bazelisk/releases/download/v1.4.0/bazelisk-linux-amd64"
if [ -f "${bazelisk_bin}" ]; then
  echo "INFO: bazelisk already installed. Skipping..."
else
  echo "INFO: Downloading bazelisk..."
  curl -sL "${bazelisk_url}" -o "${bazelisk_bin}"
  chmod 755 "${bazelisk_bin}"
fi

# Install buildifier
buildifier_bin="${HOME}/bin/buildifier"
if [ -f "${buildifier_bin}" ]; then
  echo "INFO: buildifier already installed. Skipping..."
else
  buildtools_src_dir="${HOME}/src/bazelbuild/buildtools"
  if [ -d "${buildtools_src_dir}" ]; then
    echo "INFO: Updating buildtools src..."
    cd "${buildtools_src_dir}"
    git pull -q
    cd - &>/dev/null
  else
    echo "INFO: Cloning bazel buildtools to ${buildtools_src_dir}..."
    env git clone -q --depth=1 https://github.com/bazelbuild/buildtools "${buildtools_src_dir}" || {
      echo "ERROR: git clone of buildtools repo failed"
      exit 1
    }
  fi
  echo "INFO: Building buildifier..."
  cd "${buildtools_src_dir}"
  bazel build //buildifier --noshow_progress &>/dev/null
  echo "INFO: Installing buildifier to ${buildifier_bin}..."
  cp bazel-bin/buildifier/linux_amd64_stripped/buildifier "${buildifier_bin}"
  cd - &>/dev/null
fi

# Install bazel via apt just for up-to-date bash completions.
if [ ! -z "$(dpkg -s bazel)" ]; then
  echo "INFO: bazel apt package already installed. Skipping..."
else
  echo "INFO: Installing bazel apt package..."
  curl -sL https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
  echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
  sudo apt-get -qq update
  sudo apt-get -qq install -y bazel
fi
