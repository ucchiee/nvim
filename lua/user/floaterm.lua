vim.cmd([[
  let g:floaterm_gitcommit='floaterm'
  let g:floaterm_autoinsert=1
  let g:floaterm_width=0.9
  let g:floaterm_height=0.9
  let g:floaterm_wintitle=0
  let g:floaterm_autoclose=1
]])
-- local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
-- map('n', '<leader>j;', ':FloatermToggle<CR>', opts)
-- map('n', '<leader>gl', ':FloatermNew lazygit<CR>', opts)
-- map('n', '<leader>lg', ':FloatermNew lazygit<CR>', opts)
-- another way to toggle terminal
-- map('n', '<leader>jh', ':new<CR>:ter<CR>i', opts)
-- map('n', '<leader>jv', ':vnew<CR>:ter<CR>i', opts)
