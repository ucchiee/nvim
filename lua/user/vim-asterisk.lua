-- local ok, _ = pcall(require, "vim-asterisk")
-- if not ok then
--   return
-- end

vim.keymap.set("", "*", "<Plug>(asterisk-*)", {})
vim.keymap.set("", "#", "<Plug>(asterisk-#)", {})
vim.keymap.set("", "g*", "<Plug>(asterisk-g*)", {})
vim.keymap.set("", "g#", "<Plug>(asterisk-g#)", {})
vim.keymap.set("", "z*", "<Plug>(asterisk-z*)", {})
vim.keymap.set("", "z#", "<Plug>(asterisk-z#)", {})
vim.keymap.set("", "gz*", "<Plug>(asterisk-gz*)", {})
vim.keymap.set("", "gz#", "<Plug>(asterisk-gz*)", {})

vim.cmd([[let g:asterisk#keeppos = 0]])
