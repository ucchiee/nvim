" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>  :resize -2<CR>
nnoremap <silent> <M-k>  :resize +2<CR>
nnoremap <silent> <M-h>  :vertical resize -2<CR>
nnoremap <silent> <M-l>  :vertical resize +2<CR>
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUwi
" nnoremap <c-u> viwUw<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
noremap <Leader>n nzz
noremap <Leader>N Nzz

" better command line filtering
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" expand current abs path of current directory
cnoremap <<expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" Use AG in VisualStarSearch
nnoremap <leader>* :call ag#Ag('grep', '--literal ' . shellescape(expand("<cword>")))<CR>
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/', 'raw')<CR>:call ag#Ag('grep', '--literal ' . shellescape(@/))<CR>
