#!/bin/bash
set -e
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
GTK_CONFIG_DIR=$HOME/.config/gtk-3.0

echo "INFO: Installing color schemes..."
mkdir -p $HOME/.config/tilix/schemes
cp -f $dir/schemes/* $HOME/.config/tilix/schemes

echo "INFO: Installing gtk.css for title color..."
if [[ -f $GTK_CONFIG_DIR/gtk.css && ! -L $GTK_CONFIG_DIR/gtk.css ]]; then
  echo "WARNING: $GTK_CONFIG_DIR/gtk.css already exists. Skipping..."
  echo "         Copy-paste the contents of gtk.css manually to customize title bar color,"
  echo "         or delete that file and run this script again."
else
  if [[ -L $GTK_CONFIG_DIR/gtk.css ]]; then
    echo "INFO: Over-writing existing symlink $GTK_CONFIG_DIR/gtk.css"
  fi
  ln -sf $dir/gtk.css $GTK_CONFIG_DIR/gtk.css
fi

echo "INFO: Installing dconf config..."
dconf load /com/gexperts/Tilix/ < $dir/tilix.dconf
