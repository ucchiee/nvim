local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "|", ":m .-2<CR>", opts)
keymap("n", "\\", ":m .+1<CR>", opts)

-- Useful binding
keymap("n", "<leader>o", "o<esc>^C", opts)
keymap("n", "<leader>O", "O<esc>^C", opts)
keymap("n", "<leader>n", "nzz", opts)
keymap("n", "<leader>N", "Nzz", opts)

keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch!<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "|", ":m '<-2<CR>gv", opts)
keymap("n", "\\", ":m '>+1<CR>gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Command Mode --
-- Better command line filtering
keymap("c", "<C-n>", "<Down>", opts)
keymap("c", "<C-p>", "<Up>", opts)


-- plugin keybinding
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)

-- nvim tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- buffer-related
keymap("n", "<C-c>", ":Bdelete<cr>", opts)
