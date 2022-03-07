#!/bin/bash
dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

if [ -z "$ZSH" ]; then
  ZSH="$HOME/.oh-my-zsh"
fi

if [ -d "$ZSH" ]; then
  echo "INFO: oh-my-zsh already set up. Skipping..."
else
  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  echo "INFO: Installing oh-my-zsh..."
  env git clone -q --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || {
    echo "ERROR: git clone of oh-my-zsh repo failed"
    exit 1
  }
fi

if [ ! -e "$HOME/.zshrc" ]; then
  echo "INFO: Creating $HOME/.zshrc"
  touch "$HOME/.zshrc"
fi

# Add line to source ./zshrc if it doesn't already exist in .zshrc.
line="source $dir/zshrc"
file="$HOME/.zshrc"
grep -qF -- "$line" "$file" || echo "$line" >> "$file"

# Install themes.
if [ -d "$ZSH/custom/themes/powerlevel9k" ]; then
  echo "INFO: powerlevel9k theme already set up. Skipping..."
else
  echo "INFO: Installing powerlevel9k theme..."
  env git clone -q https://github.com/bhilburn/powerlevel9k.git "$ZSH/custom/themes/powerlevel9k" || {
    echo "ERROR: git clone of powerlevel9k repo failed"
    exit 1
  }
fi

# Install plugins.
if [ -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "INFO: zsh-syntax-highlighting plugin already set up. Skipping..."
else
  echo "INFO: Installing zsh-syntax-highlighting plugin..."
  env git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH/custom/plugins/zsh-syntax-highlighting" || {
    echo "ERROR: git clone of zsh-syntax-highlighting repo failed"
    exit 1
  }
fi

if [ -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  echo "INFO: zsh-autosuggestions plugin already set up. Skipping..."
else
  echo "INFO: Installing zsh-autosuggestions plugin..."
  env git clone -q https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH/custom/plugins/zsh-autosuggestions" || {
    echo "ERROR: git clone of zsh-autosuggestions repo failed"
    exit 1
  }
fi

#if [ -d "$ZSH/custom/plugins/bazel" ]; then
#  echo "INFO: bazel plugin already set up. Skipping..."
#else
#  echo "INFO: Installing bazel plugin..."
#  env git clone -q https://github.com/jackwish/bazel "$ZSH/custom/plugins/bazel" || {
#    echo "ERROR: git clone of bazel repo failed"
#    exit 1
#  }
#fi
