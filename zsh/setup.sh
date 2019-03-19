#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
  echo "INFO: zsh already set up. Skipping..."
else
  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || {
    echo "ERROR: git clone of oh-my-zsh repo failed"
    exit 1
  }
fi

if [[ ! -e $HOME/.zshrc ]]; then
  echo "INFO: Creating $HOME/.zshrc"
  touch "$HOME/.zshrc"
fi

# Add line to source ./zshrc if it doesn't already exist in .zshrc.
line="source $dir/zshrc"
file="$HOME/.zshrc"
grep -qF -- "$line" "$file" || echo "$line" >> "$file"
