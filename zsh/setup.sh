#!/bin/bash
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

if [ ! -n "$ZSH" ]; then
  ZSH="$HOME/.oh-my-zsh"
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

# Install plugins.
if [ -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "INFO: zsh-syntax-highlighting already set up. Skipping..."
else
  env git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH/custom/plugins/zsh-syntax-highlighting" || {
    echo "ERROR: git clone of zsh-syntax-highlighting repo failed"
    exit 1
  }
fi

if [ -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  echo "INFO: zsh-autosuggestions already set up. Skipping..."
else
  env git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH/custom/plugins/zsh-autosuggestions" || {
    echo "ERROR: git clone of zsh-autosuggestions repo failed"
    exit 1
  }
fi
