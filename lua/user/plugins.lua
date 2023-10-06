local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({
	-- My plugins here
	"lewis6991/impatient.nvim",
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"windwp/nvim-ts-autotag", -- AutoTag, integrates with treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"ahmedkhalf/project.nvim",
	"goolord/alpha-nvim",
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	-- "kana/vim-textobj-user",
	-- "kana/vim-textobj-entire",
	"lukas-reineke/indent-blankline.nvim",
	--"max397574/better-escape.nvim",

	-- debug adapter protocol
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"mfussenegger/nvim-dap-python",

	-- status line
	"nvim-lualine/lualine.nvim",
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},

	-- tpope plugins
	"tpope/vim-surround",
	"tpope/vim-repeat",

	-- colorscheme
	-- "lunarvim/darkplus.nvim",
	-- "folke/tokyonight.nvim",
	-- "rebelot/kanagawa.nvim",
	--"rmehri01/onenord.nvim",
	"sainnhe/gruvbox-material",
	{ "catppuccin/nvim", name = "catppuccin" },

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/cmp-nvim-lua", -- nvim api completion
	"hrsh7th/cmp-nvim-lsp", -- lsp
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"onsails/lspkind.nvim",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	{ "ucchiee/vscode-hugo-snippets", branch = "feat/ucchiee-template" }, -- hugo snippet

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig", -- enable LSP
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"folke/lsp-colors.nvim",
	"j-hui/fidget.nvim",
	"glepnir/lspsaga.nvim",
	"ray-x/lsp_signature.nvim",
	"folke/trouble.nvim",
	"rmagatti/goto-preview",
	{ "smjonas/inc-rename.nvim", config = true },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	"nvim-telescope/telescope-media-files.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "tami5/sqlite.lua" },
	},

	-- FTerm
	"voldikss/vim-floaterm",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- Git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"AckslD/nvim-FeMaco.lua",

	-- Folding
	--[[ { ]]
	--[[ 	"kevinhwang91/nvim-ufo", ]]
	--[[ 	dependencies = "kevinhwang91/promise-async", ]]
	--[[ }, ]]

	-- syntax tree surfer
	"ziontee113/syntax-tree-surfer",

	-- symbol
	"simrat39/symbols-outline.nvim",

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	"sindrets/winshift.nvim",
	"monaqa/dial.nvim",
	"kevinhwang91/nvim-hlslens",
	"petertriho/nvim-scrollbar",
	"andymass/vim-matchup",
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		version = "*",
	},
	"zdcthomas/medit",
	"haya14busa/vim-asterisk",

	-- copy and paster through OSC 52
	"ojroques/nvim-osc52",

	"postfen/clipboard-image.nvim",
})
