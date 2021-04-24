if [ -e ~/.config/nvim/autoload.plug.vim ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
if type nvim > /dev/null 2>&1; then
  echo "Installing Neovim-plugin."
  nvim -c PlugInstall -c qall
else
  echo "Neovim is not installed, or 'nvim' is not in the PATH."
  exit 1
fi

exit 0
