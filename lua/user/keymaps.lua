local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
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

-- Navigate buffers (these will be overwitten by BufferLine)
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "|", ":m .-2<CR>", opts)
keymap("n", "\\", ":m .+1<CR>", opts)

-- Useful binding
keymap("n", "<leader>o", 'o<esc>^"_C', opts)
keymap("n", "<leader>O", 'O<esc>^"_C', opts)
keymap("n", "<leader>n", "nzz", opts)
keymap("n", "<leader>N", "Nzz", opts)

keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch!<CR>", opts)

-- Press jk fast to enter <ESC>
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "<C-C>", "<ESC>", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Move text up and down
keymap("n", "\\", ":m .+1<CR>", opts)
keymap("n", "|", ":m .-2<CR>", opts)
-- keymap("v", "\\", ":m '>+1<CR>gv", opts)
-- keymap("v", "|", ":m '<-2<CR>gv", opts)

-- Do the last substitute (this is on by default)
keymap("n", "&", ":&&<CR>", opts)
keymap("x", "&", ":&&<CR>", opts)

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
