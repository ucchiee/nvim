local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "plugins.lua" },
	command = "PackerSync",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- snapshot = "uu-desk.json",
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("windwp/nvim-ts-autotag") -- AutoTag, integrates with treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("lewis6991/impatient.nvim")
	use("ahmedkhalf/project.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("kana/vim-textobj-user")
	use("kana/vim-textobj-entire")
	use("lukas-reineke/indent-blankline.nvim")
	-- use("max397574/better-escape.nvim")

	-- debug adapter protocol
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })

	-- status line
	use("nvim-lualine/lualine.nvim")
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- tpope plugins
	use("tpope/vim-surround")
	use("tpope/vim-repeat")

	-- colorscheme
	-- use "lunarvim/darkplus.nvim"
	-- use("folke/tokyonight.nvim")
	-- use("rebelot/kanagawa.nvim")
	use("rmehri01/onenord.nvim")
	use("sainnhe/gruvbox-material")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lua") -- nvim api completion
	use("hrsh7th/cmp-nvim-lsp") -- lsp
	-- use("hrsh7th/cmp-cmdline-history") -- command line
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("onsails/lspkind.nvim")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use({ "ucchiee/vscode-hugo-snippets", branch = "feat/ucchiee-template" }) -- hugo snippet

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("folke/lsp-colors.nvim")
	use("j-hui/fidget.nvim")
	use("glepnir/lspsaga.nvim")
	use("ray-x/lsp_signature.nvim")
	use("folke/trouble.nvim")
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "tami5/sqlite.lua" },
	})

	-- FTerm
	use("voldikss/vim-floaterm")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lewis6991/spellsitter.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("AckslD/nvim-FeMaco.lua")

	-- Folding
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Scrolling
	-- use("karb94/neoscroll.nvim")

	-- syntax tree surfer
	use("ziontee113/syntax-tree-surfer")

	-- symbol
	use("simrat39/symbols-outline.nvim")

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("sindrets/winshift.nvim")
	use("monaqa/dial.nvim")
	use({ "kevinhwang91/nvim-hlslens" })
	use("petertriho/nvim-scrollbar")
	use("andymass/vim-matchup")
	use({
		"danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
		tag = "*",
	})
	use("zdcthomas/medit")
	use("haya14busa/vim-asterisk")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
