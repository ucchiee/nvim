source $HOME/.config/nvim/vim-plug/plugins.vim
if !exists('is_init')
  source $HOME/.config/nvim/general/settings.vim
  source $HOME/.config/nvim/general/paths.vim
  source $HOME/.config/nvim/keys/mappings.vim
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/themes/onedark.vim
  " source $HOME/.config/nvim/themes/airline.vim
  " source $HOME/.config/nvim/themes/tmuxline.vim
  source $HOME/.config/nvim/plug-config/barbar.vim
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/nvim-tree.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/commentary.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/sneak.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/coc-snippets.vim
  source $HOME/.config/nvim/plug-config/pydoc.vim
  luafile $HOME/.config/nvim/lua/plug-colorizer.lua
  luafile $HOME/.config/nvim/lua/plug-lualine.lua
endif
