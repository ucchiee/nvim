source $HOME/.config/nvim/vim-plug/plugins.vim
if !exists('is_init')
  source $HOME/.config/nvim/general/settings.vim
  source $HOME/.config/nvim/general/ftsettings.vim
  source $HOME/.config/nvim/keys/mappings.vim
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/themes/onedark.vim
  source $HOME/.config/nvim/plug-config/barbar.vim
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/chadtree.vim
  " source $HOME/.config/nvim/plug-config/rnvimr.vim
  source $HOME/.config/nvim/plug-config/commentary.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/sneak.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/coc-snippets.vim
  source $HOME/.config/nvim/plug-config/pydoc.vim
  source $HOME/.config/nvim/plug-config/md-img-paste.vim  " needs to install xclip (Linux)
  source $HOME/.config/nvim/plug-config/markdown-preview.vim  " needs to install xclip (Linux)
  lua require("plug-colorizer")  -- source lua/plug-colorizer.lua
  lua require("plug-gitsigns")   -- source lua/plug-gitsigns.lua
  lua require("plug-lualine")    -- source lua/plug-lualine.lua
  lua require("plug-treesitter") -- source lua/plug-treesitter.lua
endif
