augroup spell
  autocmd!
  autocmd FileType markdown,txt setlocal spell
  autocmd FileType markdown,txt setlocal wrap
augroup END
augroup filetype_lua
  autocmd!
  autocmd FileType lua :iabbrev <buffer> fnc function<space>name()<space>end<left><left><left>
  autocmd FileType lua :iabbrev <buffer> function NOPENOPENOPE
augroup END
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <leader>q Vatzf
augroup END
