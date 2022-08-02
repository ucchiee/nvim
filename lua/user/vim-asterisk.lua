-- local ok, _ = pcall(require, "vim-asterisk")
-- if not ok then
--   return
-- end

vim.keymap.set("", "*", "<Plug>(asterisk-z*)", {})
vim.keymap.set("", "#", "<Plug>(asterisk-z#)", {})
vim.keymap.set("", "g*", "<Plug>(asterisk-gz*)", {})
vim.keymap.set("", "g#", "<Plug>(asterisk-gz*)", {})

vim.cmd([[let g:asterisk#keeppos = 1]])
