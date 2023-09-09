#!/bin/bash
set -e

# Install bazelisk
# NOTE: Only works on linux.
bazelisk_bin="${HOME}/bin/bazel"
bazelisk_url="https://github.com/bazelbuild/bazelisk/releases/download/v1.18.0/bazelisk-linux-amd64"
if [ -f "${bazelisk_bin}" ]; then
	echo "INFO: bazelisk already installed. Skipping..."
else
	echo "INFO: Downloading bazelisk..."
	curl -sL "${bazelisk_url}" -o "${bazelisk_bin}"
	chmod 755 "${bazelisk_bin}"
fi

# Install buildifier
# NOTE: Only works on linux.
buildifier_bin="${HOME}/bin/buildifier"
buildifier_url="https://github.com/bazelbuild/buildtools/releases/download/v6.3.3/buildifier-linux-amd64"
if [ -f "${buildifier_bin}" ]; then
	echo "INFO: buildifier already installed. Skipping..."
else
	echo "INFO: Downloading buildifier..."
	curl -sL "${buildifier_url}" -o "${buildifier_bin}"
	chmod 755 "${buildifier_bin}"
fi
