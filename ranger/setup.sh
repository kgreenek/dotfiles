#!/bin/bash
set -e
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
RANGER_CONFIG_DIR=$HOME/.config/ranger

# Ensure ranger is in the path since it is installed via pipx.
export PATH="${HOME}/.local/bin:${PATH}"

if [[ ! -d $RANGER_CONFIG_DIR ]]; then
  echo "WARNING: $RANGER_CONFIG_DIR does not exist, so creating it. Is ranger installed?"
  mkdir -p "$RANGER_CONFIG_DIR"
fi

if [[ -f $RANGER_CONFIG_DIR/rc.conf && ! -L $RANGER_CONFIG_DIR/rc.conf ]]; then
  echo "WARNING: $RANGER_CONFIG_DIR/rc.conf already exists. Skipping..."
else
  if [[ -L $RANGER_CONFIG_DIR/rc.conf ]]; then
    echo "INFO: Over-writing existing symlink $RANGER_CONFIG_DIR/rc.conf"
  fi
  ln -sf "$dir/rc.conf" "$RANGER_CONFIG_DIR/rc.conf"
fi

if [[ ! -f $HOME/.config/ranger/scope.sh ]]; then
  ranger --copy-config=scope
fi
