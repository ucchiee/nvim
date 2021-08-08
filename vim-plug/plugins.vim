" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
  let g:is_init=1
endif

let g:polyglot_disabled = ['markdown']

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " File Explorer
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Theme
  Plug 'joshdick/onedark.vim'
  " Tmuxline
  Plug 'edkolev/tmuxline.vim', { 'on': ['Tmuxline', 'TmuxlineSimple', 'TmuxlineSnapshot'] }
  " Stable version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " barbar
  Plug 'romgrk/barbar.nvim'
  " Statusline
  " Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'hoob3rt/lualine.nvim'
  " Ranger
  Plug 'kevinhwang91/rnvimr'
  " Comment out
  Plug 'tpope/vim-commentary'
  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " colorizer
  Plug 'norcalli/nvim-colorizer.lua'
  " raibow
  Plug 'junegunn/rainbow_parentheses.vim'
  " startify
  Plug 'mhinz/vim-startify'
  " Git
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  " which key
  Plug 'liuchengxu/vim-which-key'
  " Sneak
  Plug 'justinmk/vim-sneak'
  " quick-scope
  Plug 'unblevable/quick-scope'
  " terminal
  Plug 'voldikss/vim-floaterm', {'commit': '74d33de'}
  " snippets
  Plug 'honza/vim-snippets'
  " pydocstring
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
  " surround
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  " key bindings for move
  Plug 'tpope/vim-unimpaired'
  " show indent
  Plug 'nathanaelkane/vim-indent-guides'
  " textobj
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  " visual start search
  Plug 'bronson/vim-visual-star-search'
  " html
  " Plug 'mattn/emmet-vim'
call plug#end()

autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall
  \| endif
