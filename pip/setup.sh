#!/bin/bash
set -e

if [ -n "${VIRTUAL_ENV}" ]; then
  echo "ERROR: Cannot run from within a virtualenv"
  exit 1
fi

pipx install -q grip
pipx install -q ranger-fm
pipx install -q yapf
