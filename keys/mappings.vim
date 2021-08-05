" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>  :resize -2<CR>
nnoremap <silent> <M-k>  :resize +2<CR>
nnoremap <silent> <M-h>  :vertical resize -2<CR>
nnoremap <silent> <M-l>  :vertical resize +2<CR>
" I hate escape more than anything else
inoremap kj <Esc>
inoremap jk <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viw~gi
inoremap <c-y> <ESC>b~gi

" <C-l> in general mode will move to text buffer
nnoremap <C-l>     :bnext<CR>  " will be overwritten by barbar
nnoremap <S-Right> :blast<CR>  " will be overwritten by barbar
" <C-h> go back
nnoremap <C-h>     :bprevious<CR>
nnoremap <S-Left>  :bfirst<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-q> :wq!<CR>
" Use control-c instead of escape
" nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Useful bindings
nnoremap <Leader>o o<Esc>^C
nnoremap <Leader>O O<Esc>^C
noremap <Leader>n nzz
noremap <Leader>N Nzz
nnoremap G Gzz  " <Leader>G might be used by git-relative plugin so I don't use that

" I hate unintentionally moving cursor in insert mode
inoremap <Up>    nop
inoremap <Down>  nop
inoremap <Left>  nop
inoremap <Right> nop

" Move lines
nnoremap \| :m .-2<CR>
nnoremap \  :m .+1<CR>
vnoremap \| :m '<-2<CR>gv
vnoremap \  :m '>+1<CR>gv

" Better command line filtering
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Expand current abs path of current directory
cnoremap <<expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

iabbrev @@ fantomyuu0623@gmail.com
