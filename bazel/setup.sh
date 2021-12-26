#!/bin/bash
set -e

# Install bazelisk
# NOTE: Only works on linux.
bazelisk_bin="${HOME}/bin/bazel"
bazelisk_url="https://github.com/bazelbuild/bazelisk/releases/download/v1.5.0/bazelisk-linux-amd64"
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
  "${bazelisk_bin}" build //buildifier --noshow_progress &>/dev/null
  echo "INFO: Installing buildifier to ${buildifier_bin}..."
  cp bazel-bin/buildifier/buildifier_/buildifier "${buildifier_bin}"
  cd - &>/dev/null
fi
