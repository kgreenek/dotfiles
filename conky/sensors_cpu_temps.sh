#!/bin/bash
if [ -z "$(command -v sensors)" ]; then
  echo "lm-sensors not installed"
  exit 0
fi
sensors_output="$(sensors)"
cores_output="$(echo "${sensors_output}" | grep "^Core" | sed -e 's;\s*(.*);;g')"
if [ ! -z "${cores_output}" ]; then
  echo "${cores_output}"
  exit 0
fi
echo "${sensors_output}" | grep -e "^temp" | grep -v "N/A" | sed -e 's;\s*(.*);;g'
