local ok, dial_map = pcall(require, "dial.map")
if not ok then
  return
end
vim.keymap.set("n", "<C-a>", dial_map.inc_normal(), {noremap = true})
vim.keymap.set("n", "<C-x>", dial_map.dec_normal(), {noremap = true})
vim.keymap.set("v", "<C-a>", dial_map.inc_visual(), {noremap = true})
vim.keymap.set("v", "<C-x>", dial_map.dec_visual(), {noremap = true})
vim.keymap.set("v", "g<C-a>", dial_map.inc_gvisual(), {noremap = true})
vim.keymap.set("v", "g<C-x>", dial_map.dec_gvisual(), {noremap = true})

-- Visit the url below to configure additional augend
-- https://github.com/monaqa/dial.nvim
