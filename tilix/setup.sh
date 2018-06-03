#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GTK_CONFIG_DIR=$HOME/.config/gtk-3.0

echo "Installing color schemes..."
mkdir -p $HOME/.config/tilix/schemes
cp -f $DIR/schemes/* $HOME/.config/tilix/schemes

echo "Installing gtk.css for title color..."
if [[ -f $GTK_CONFIG_DIR/gtk.css && ! -L $GTK_CONFIG_DIR/gtk.css ]]; then
  echo "WARNING: $GTK_CONFIG_DIR/gtk.css already exists. Skipping..."
  echo "         Copy-paste the contents of gtk.css manually to customize title bar color,"
  echo "         or delete that file and run this script again."
else
  if [[ -L $GTK_CONFIG_DIR/gtk.css ]]; then
    echo "INFO: Over-writing existing symlink $GTK_CONFIG_DIR/gtk.css"
  fi
  ln -sf $DIR/gtk.css $GTK_CONFIG_DIR/gtk.css
fi

echo "Installing dconf config..."
dconf load /com/gexperts/Tilix/ < $DIR/tilix.dconf

echo "INFO: Restart tilix for changes to take effect"
