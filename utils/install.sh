# Check whether nvim is installed.
if !(type nvim > /dev/null 2>&1); then
  echo "Neovim is not installed, or 'nvim' is not in the PATH."
  exit 1
fi

# Install vim-plug
if [ -e ~/.config/nvim/autoload.plug.vim ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Install vim plugin
echo "Installing Neovim-plugin."
nvim -c PlugInstall -c qall
exit 0
