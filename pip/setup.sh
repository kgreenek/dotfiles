#!/bin/bash
set -e

if [ -n "${VIRTUAL_ENV}" ]; then
  echo "ERROR: Cannot run from within a virtualenv"
  exit 1
fi

# Use the system pip to bootstrap a user-installed pip. Do this because the system version of pip
# is usually very old.
# We also want to avoid over-writing the version of pip that is managed by apt in /usr.
pip3 install -q --user pip
# Clear the hash to prevent bash from using the cached location for pip3 (/usr/bin/pip3) instead of
# the new local install from the line above.
hash -d pip3

pip3 install -q --user \
  grip \
  pynvim \
  ranger-fm \
  yapf
