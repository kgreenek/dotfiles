#!/bin/bash
set -e
fzf_install_dir="${HOME}/.fzf"

if [ -d "$fzf_install_dir" ]; then
  echo "INFO: fzf already cloned. Skipping..."
else
  echo "INFO: Cloning fzf to ${fzf_install_dir}..."
  git clone -q --depth=1 https://github.com/junegunn/fzf.git "${fzf_install_dir}"
  # Don't update rc, because it's already handled in our custom bashrc / zshrc.
  # TODO: Figure out how to always install both bash and zsh.
  "${fzf_install_dir}/install" --key-bindings --completion --no-update-rc
fi
