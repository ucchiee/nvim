#!/bin/sh

set -o nounset
set -o errexit

installpip() {
  # install pyenv? pipenv?
  echo "Install python3 first."
  echo "There're various ways to install python. i.e original, pyenv..."
  echo "You may wanna chose your favorite one."
  exit
}

install_node_ubuntu() {
  sudo apt install nodejs
  sudo apt install npm
}

install_node_mac() {
  brew install node
  brew install yarn
}

installnode() {
	echo "Installing node..."
	[ "$(uname)" == "Darwin" ] && install_node_mac
	[ -n "$(uname -a | grep Ubuntu)" ] && install_node_ubuntu
  [ -f "/etc/arch-release" ] && echo "Arch not currently supported"
  [ -f "/etc/fedora-release" ] && "Fedora not currently supported"
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
	sudo npm i -g neovim
}

asktoinstallnode() {
	echo "node not found"
	echo -n "Would you like to install node now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnode
}

install_nvim_mac() {
  brew install neovim
}

install_nvim_ubuntu() {
  sudo apt install neovim
  # sudo apt install python-neovim
  # sudo apt install python3-neovim
}

installnvim() {
	echo "Installing nvim..."
	[ "$(uname)" == "Darwin" ] && install_nvim_mac
	[ -n "$(uname -a | grep Ubuntu)" ] && install_nvim_ubuntu
  [ -f "/etc/arch-release" ] && echo "Arch not currently supported"
  [ -f "/etc/fedora-release" ] && "Fedora not currently supported"
	[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ] && echo "Windows not currently supported"
	sudo npm i -g neovim
}

asktoinstallnvim() {
	echo "nvim not found"
	echo -n "Would you like to install nvim now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnvim
}

asktoinstallnode() {
	echo "nvim not found"
	echo -n "Would you like to install nvim now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnvim
}

installpynvim() {
  echo "Installing pynvim"
  pip3 install pynvim
}

clone_config() {
  echo "cloning config files"
  git clone https://github.com/tomato-300yen/nvim.git ~/.config/nvim
  echo "Installing Neovim-plugin."
  nvim -c PlugInstall -c qall
}

# check pip installed
which pip3 >/dev/null && echo "pip installed, moving on..." || installpip

# install nvim
which nvim >/dev/null && echo "nvim installed, moving on..." || asktoinstallnvim

# install node and neovim support
which node >/dev/null && echo "node installed, moving on..." || asktoinstallnode

# install pynvim
pip3 list | grep pynvim >/dev/null && echo "pynvim installed, moving on..." || installpynvim

# clone config
if [ -a "$HOME/.config/nvim/init.vim" ]; then
  echo "There's already your init.vim"
  echo "Move that first."
else
  clone_config
fi
