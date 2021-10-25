" Spell setting in markdowh and txt ---------{{{
augroup spell
  autocmd!
  " autocmd FileType markdown,txt setlocal spell
  autocmd FileType markdown,txt setlocal wrap
  autocmd FileType markdown,txt setlocal complete+=k
augroup END
" }}}

" markdown mapping -------- {{{
augroup md_headline
  autocmd!
  autocmd FileType markdown :onoremap <buffer> ah :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
  autocmd FileType markdown :onoremap <buffer> ih :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
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

onoremap in@ :<c-u>execute "normal! k$/[^ ]\\+@[^ ]\\+\r:nohlsearch\rviW"<cr>

" LaTeX settings, starting server for LaTeX inverse search.
" Add 'nvr --servername "/tmp/sv4vim%1" --remote-silent +%2 "%1"'
" to qpdfview/edit/settings/Sopurce\ editor
" function! s:myinversetex()
"     if !filereadable('/tmp/sv4nvim' . expand("%:p"))
"         call mkdir('/tmp/sv4nvim' . expand("%:p:h"),"p")
"         call serverstart('/tmp/sv4nvim' . expand("%:p"))
"     endif
" endfunction
" command! Serverorig call s:myinversetex()

" augroup latex_new
" " texソースのときに自動実行
" autocmd!
"   autocmd BufRead *.tex Serverorig
"   autocmd BufRead *.ltx Serverorig
"   autocmd BufWritePost *.tex Serverorig
"   autocmd BufWritePost *.ltx Serverorig
" augroup END
