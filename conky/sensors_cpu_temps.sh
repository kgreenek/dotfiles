#!/bin/bash
if [ -z "$(command -v sensors)" ]; then
  echo "lm-sensors not installed"
  exit 0
fi
sensors_output="$(sensors)"
temps_str="$(echo "${sensors_output}" | grep "^Core")"
if [ -z "${temps_str}" ]; then
  temps_str="$("${sensors_output}" | grep -e "^temp" | grep -v "N/A")"
fi
if [ -z "${temps_str}" ]; then
  echo "CPU temps not found"
  exit 0
fi
# Remove the extra info from sensors. It looks like this "(high = +100C, ...)"
temps_str="$(echo "${temps_str}" | sed -e 's;\s*(.*);;g')"
IFS=$'\n'
temps=(${temps_str})
num_lines="${#temps[@]}"
if [ "${num_lines}" -lt 4 ]; then
  echo "${temps_str}"
  exit 0
fi
temps_str=""
num_wrapped_lines=$(((num_lines + 1) / 2))
for ((i=0; i < num_wrapped_lines; i++)); do
  right_idx=$((i + num_wrapped_lines))
  if [ "${right_idx}" -lt "${num_lines}" ]; then
    temps_str="${temps_str}${temps[${i}]}\t\t${temps[${right_idx}]}\n"
  else
    temps_str="${temps_str}${temps[${i}]}\n"
  fi
done
printf "${temps_str}"
