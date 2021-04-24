#!/bin/sh

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

# Check whether nvim is installed.
if !(type nvim > /dev/null 2>&1); then
  echo "Neovim is not installed, or 'nvim' is not in the PATH."
  exit 1
fi

# Install vim plugin
echo "Installing Neovim-plugin."
nvim -c PlugInstall -c qall
exit 0
