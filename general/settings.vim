" set leader key
let g:mapleader = "\<Space>"

set autoindent                          " Good auto indent
set background=dark                     " Tell vim what the background color looks like
set clipboard=unnamedplus               " Copy paste between vim and everything else
set cmdheight=1                         " More space for displaying messages
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline                          " Enable highlighting of the current line
set encoding=utf-8                      " The encoding displayed
set expandtab                           " Converts tabs to spaces
set fileencoding=utf-8                  " The encoding written to file
set formatoptions-=cro                  " Stop newline continution of comments
set hidden                              " Required to keep multiple buffers open multiple buffers
set ignorecase                          " Ignore case
set iskeyword+=-                      	" treat dash separated words as a word text object"
" set laststatus=2                        " Always display the status line
set mouse=a                             " Enable your mouse
set nobackup                            " This is recommended by coc
set nowrap                              " Display long lines as just one line
set nowritebackup                       " This is recommended by coc
set number                              " Line numbers
set pumheight=10                        " Makes popup menu smaller
set ruler              			            " Show the cursor position all the time
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set showtabline=2                       " Always show tabs
set smartcase                           " Override ignore case for mixed case searches
set smartindent                         " Makes indenting smart
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 4 spaces for a tab
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set updatetime=300                      " Faster completion
syntax enable                           " Enables syntax highlighing
set relativenumber
"set autochdir                          " Your working directory will always be the same as your working directory
" set spell                               " Enables spell check
" set complete+=k                         " Enables completion by spell dictionary

" You can't stop me
cmap w!! w !sudo tee %
" turn off highlighting
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
