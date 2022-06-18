local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "F1", ':lua require("dap").step_into()<cr>', opts)
keymap("n", "F2", ':lua require("dap").step_out()<cr>', opts)
keymap("n", "F3", ':lua require("dap").step_over()<cr>', opts)
keymap("n", "F4", ':lua require("dap").continue()<cr>', opts)
