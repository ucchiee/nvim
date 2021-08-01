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
augroup md_headline
  autocmd!
  onoremap <buffer> ah :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
  onoremap <buffer> ih :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
augroup END

onoremap in@ :<c-u>execute "normal! k$/[^ ]\\+@[^ ]\\+\r:nohlsearch\rviW"<cr>
