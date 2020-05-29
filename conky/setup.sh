#!/bin/bash
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

CONKY_CONFIG_DIR="${HOME}/.conky"
mkdir -p "${CONKY_CONFIG_DIR}"

if [[ -f $CONKY_CONFIG_DIR/sensors_cpu_temps.sh && ! -L $CONKY_CONFIG_DIR/sensors_cpu_temps.sh ]]; then
  echo "WARNING: $CONKY_CONFIG_DIR/sensors_cpu_temps.sh already exists. Skipping..."
else
  if [[ -L $CONKY_CONFIG_DIR/sensors_cpu_temps.sh ]]; then
    echo "INFO: Over-writing existing symlink $CONKY_CONFIG_DIR/sensors_cpu_temps.sh"
  fi
  ln -sf "$dir/sensors_cpu_temps.sh" "$CONKY_CONFIG_DIR/sensors_cpu_temps.sh"
fi

if [[ -f "${HOME}/.conkyrc" && ! -L "${HOME}/.conkyrc" ]]; then
  echo "WARNING: "${HOME}/.conkyrc" already exists. Skipping..."
else
  if [[ -L "${HOME}/.conkyrc" ]]; then
    echo "INFO: Over-writing existing symlink ${HOME}/.conkyrc"
  fi
  ln -sf "$dir/conkyrc" "${HOME}/.conkyrc"
fi
