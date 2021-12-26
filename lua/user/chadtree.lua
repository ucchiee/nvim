local chadtree_settings = {}
chadtree_settings["view.width"] = 35
chadtree_settings["theme.text_colour_set"] = "nord"
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>e", ":CHADopen<CR>", opts)
keymap("n", "<leader>co", ":CHADopen --version-ctl<CR>", opts)
