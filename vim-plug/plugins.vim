" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
  let g:is_init=1
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " File Explorer
  Plug 'scrooloose/NERDTree'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Theme
  Plug 'joshdick/onedark.vim'
  " Tmuxline
  Plug 'edkolev/tmuxline.vim', { 'on': ['Tmuxline', 'TmuxlineSimple', 'TmuxlineSnapshot'] }
  " Stable version of coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Ranger
  Plug 'kevinhwang91/rnvimr'
  " Comment out
  Plug 'tpope/vim-commentary'
  Plug 'tyru/caw.vim'
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
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
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
  " vim-abolish
  " Plug 'tpope/vim-abolish'
  " show indent
  Plug 'Yggdroot/indentLine'
  " textobj
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  " visual start search
  Plug 'bronson/vim-visual-star-search'
call plug#end()

autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall
  \| endif
