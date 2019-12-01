#!/bin/bash
set -e

if [[ $VIRTUAL_ENV && $PATH =~ (^|:)"$VIRTUAL_ENV/bin"($|:) ]]; then
  echo "WARNING: Attempting to deactivate virtualenv"
  PATH=${PATH%":$VIRTUAL_ENV/bin"}
  PATH=${PATH#"$VIRTUAL_ENV/bin:"}
  PATH=${PATH//":$VIRTUAL_ENV/bin:"/}
  unset PYTHONHOME VIRTUAL_ENV
fi

if [ ! -z "${VIRTUAL_ENV}" ]; then
  echo "ERROR: Cannot run from within a virtualenv"
  exit 1
fi

# Use the system pip to bootstrap a user installed-pip. Do this because the system version of pip
# is usually very old.
pip3 install -q --user pip
# Clear the hash to prevent bash from using the cached location for pip3 (/usr/bin/pip3) instead of
# the new local install from the line above.
hash -d pip3

pip3 install -q --user \
  grip \
  ranger-fm \
