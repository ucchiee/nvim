vim.cmd([[
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

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("TextGroup", { clear = true }),
	pattern = { "markdown", "txt", "tex" },
	command = "setlocal wrap complete+=k shiftwidth=2 spelllang+=cjk spell",
})
