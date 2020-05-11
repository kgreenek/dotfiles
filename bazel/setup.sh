#!/bin/bash
set -e

# Install bazelisk
# NOTE: Only works on linux.
bazelisk_bin="${HOME}/bin/bazel"
if [ -f "${bazelisk_bin}" ]; then
  echo "INFO: bazelisk already installed. Skipping..."
else
  bazelisk_version="v1.4.0"
  echo "INFO: Downloading bazelisk ${bazelisk_version}..."
  curl -L "https://github.com/bazelbuild/bazelisk/releases/download/${bazelisk_version}/bazelisk-linux-amd64" \
    --output "${bazelisk_bin}" --silent
  chmod 755 "${bazelisk_bin}"
fi

# Install buildifier
buildifier_bin="${HOME}/bin/buildifier"
if [ -f "${buildifier_bin}" ]; then
  echo "INFO: buildifier already installed. Skipping..."
else
  buildtools_src_dir="${HOME}/src/bazelbuild/buildtools"
  echo "INFO: Cloning bazel buildtools to ${buildtools_src_dir}..."
  git clone -q --depth=1 https://github.com/bazelbuild/buildtools "${buildtools_src_dir}"
  echo "INFO: Building buildifier..."
  cd "${buildtools_src_dir}"
  bazel build //buildifier --noshow_progress
  echo "INFO: Installing buildifier to ${buildifier_bin}..."
  cp bazel-bin/buildifier/linux_amd64_stripped/buildifier "${buildifier_bin}"
  cd -
fi
