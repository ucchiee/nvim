" Spell setting in markdowh and txt ---------{{{
augroup spell
  autocmd!
  autocmd FileType markdown,txt setlocal spell
  autocmd FileType markdown,txt setlocal wrap
  autocmd FileType markdown,txt setlocal complete+=k
augroup END
" }}}

augroup md_headline
  autocmd!
  autocmd FileType markdown :onoremap <buffer> ah :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd FileType markdown :onoremap <buffer> ih :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
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

" Vimscript file settings ---------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

onoremap in@ :<c-u>execute "normal! k$/[^ ]\\+@[^ ]\\+\r:nohlsearch\rviW"<cr>
