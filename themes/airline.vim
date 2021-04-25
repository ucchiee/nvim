" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#alt_sep = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" airline_symbols seems not defined
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.dirty='⚡'

" Switch to your current theme
let g:airline_theme = 'onedark'

" Shortform mode text
let g:airline_mode_map = {
    \ ''     : 'S',
    \ ''     : 'C-V',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 'S'      : 'S',
    \ 'V'      : 'V',
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'multi'  : 'M',
    \ 'n'      : 'N',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 's'      : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'v',
    \ }

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
" set noshowmode
