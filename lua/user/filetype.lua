vim.cmd([[
" Spell setting in markdowh and txt ---------{{{
augroup spell
  autocmd!
  " autocmd FileType markdown,txt setlocal spell
  autocmd FileType markdown,txt,tex setlocal wrap
  autocmd FileType markdown,txt,tex setlocal complete+=k
  autocmd FileType markdown,txt,tex setlocal shiftwidth=2
augroup END
" }}}

" Indentation setting ---------{{{
augroup indentation
  autocmd!
  autocmd FileType cpp setlocal shiftwidth=4
augroup END
" }}}

" markdown mapping -------- {{{
augroup md_headline
  autocmd!
  autocmd FileType markdown :onoremap <buffer> ah :<c-u>execute "normal! ?^--¥¥+$¥r:nohlsearch¥rg_vk0"<cr>
  autocmd FileType markdown :onoremap <buffer> ih :<c-u>execute "normal! ?^--¥¥+$¥r:nohlsearch¥rkvg_"<cr>
augroup END
" }}}

" lua abbreviation ---------{{{
augroup filetype_lua
  autocmd!
  autocmd FileType lua :iabbrev <buffer> fnc function<space>name()<space>end<left><left><left>
  autocmd FileType lua :iabbrev <buffer> function NOPENOPENOPE
augroup END
" }}}

" html mapping ------------{{{
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <leader>q Vatzf
augroup END
" }}}

" Vimscript folding setting ---------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=99
augroup END
" }}}

onoremap in@ :<c-u>execute "normal! k$/[^ ]¥¥+@[^ ]¥¥+¥r:nohlsearch¥rviW"<cr>
]])
