#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing ambience_green_on_black color scheme..."
mkdir -p ~/.config/tilix/schemes
cp -f $DIR/ambience_green_on_black.json $HOME/.config/tilix/schemes

echo "Installing gtk.css for title color..."
if [ -f $HOME/.config/gtk-3.0/gtk.css ]; then
  echo "$HOME/.config/gtk-3.0/gtk.css already exists!!!"
  echo "Copy-paste the contents of gtk.css manually"
else
  cp $DIR/gtk.css $HOME/.config/gtk-3.0
fi

echo "Installing dconf config..."
dconf load /com/gexperts/Tilix/ < $DIR/tilix.dconf

echo "Done! Restart tilix for changes to take effect"
