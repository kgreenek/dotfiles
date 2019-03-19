#!/bin/bash
# This is a fix required for tilix and other VTE-based terminal emulators in Ubuntu and Arch.
# See: https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte-2.91.sh
fi
