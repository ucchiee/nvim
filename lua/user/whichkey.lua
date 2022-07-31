local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<cr>', "Comment" },
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<cr>", "Save" },
	-- ["c"] = { "<cmd>Bdelete!<cr>", "Close Buffer" },  -- use <C-C>
	-- ["h"] = { "<cmd>nohlsearch<cr>", "No Highlight" },  -- use <esc><esc>
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["t"] = { "<cmd>Telescope live_grep theme=ivy hidden=true<cr>", "Find Text" },
	["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
	["v"] = { "<C-w>v", "Split Right" },
	["h"] = { "<C-w>s", "Split Down" },
	["r"] = { ":so ~/.config/nvim/init.lua<cr>", "Reload init.lua" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		l = { "<cmd>FloatermNew lazygit<cr>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		S = { "<cmd>lua require 'gitsigns'.stage_buffer()", "Stage Buffer" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		r = { '<cmd>lua require"gitsigns".detach()<CR><cmd>lua require"gitsigns".attach()<CR>', "Reload Gitsigns" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		D = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		d = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		y = { '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', "Get link" },
		Y = {
			'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			"Open in browser",
		},
	},

	l = {
		name = "LSP",
		a = { ":Telescope lsp_code_actions<cr>", "Code Action" },
		d = { ":Telescope lsp_definitions<cr>", "Definitions" },
		D = { ":Telescope diagnostics<cr>", "Diagnostics" },
		F = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { ":Telescope lsp_references<cr>", "References" },
		R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		p = {
			name = "Goto Preview",
			d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
			i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
			r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "References" },
			P = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All" },
		},
		g = { "<cmd>FloatermNew lazygit<cr>", "Lazygit" }, -- this is not lsp related
	},
	s = {
		name = "Search",
		b = { ":Telescope git_branches<cr>", "Checkout branch" },
		c = { ":Telescope colorscheme<cr>", "Colorscheme" },
		d = { ":Telescope diagnostics<cr>", "Diagnostics" },
		h = { ":Telescope help_tags<cr>", "Find Help" },
		k = { ":Telescope keymaps<cr>", "Keymaps" },
		r = { ":Telescope oldfiles<cr>", "Open Recent File" },
		C = { ":Telescope commands<cr>", "Commands" },
		M = { ":Telescope man_pages<cr>", "Man Pages" },
		R = { ":Telescope registers<cr>", "Registers" },
	},

	j = {
		name = "Terminal",
		[";"] = { "<cmd>FloatermToggle<cr>", "Float" },
		["h"] = { ":new<cr>:ter<cr>i", "Horizontal" },
		["v"] = { ":vnew<cr>:ter<cr>i", "Vertical" },
		["s"] = { "<cmd>FloatermNew ncdu<cr>", "ncdu" },
		["b"] = { "<cmd>FloatermNew btm<cr>", "btm" },
		["p"] = { "<cmd>FloatermNew python<cr>", "Python" },
		["g"] = { "<cmd>FloatermNew lazygit<cr>", "Lazygit" },
		["d"] = { "<cmd>FloatermNew lazydocker<cr>", "Lazydocker" },
		-- ['f'] = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		-- ['h'] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		-- ['v'] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	d = {
		name = "dap",
		-- ["o"] = { ':lua require("dapui").open()', "open" },
		-- ["c"] = { ':lua require("dapui").close()', "close" },
		["t"] = { ':lua require("dapui").toggle()<cr>', "toggle" },
		["e"] = { ':lua require("dapui").eval()<cr>', "eval under cursor" },
		["E"] = { ':lua require("dapui").eval(vim.fn.input("eval: "))<cr>', "eval interactive" },
		["b"] = { ':lua require("dap").toggle_breakpoint()<cr>', "breakpoint" },
		["B"] = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', "Cbreakpoint" },
		["j"] = { ':lua require("dap").step_over()<cr>', "step over" },
		["n"] = { ':lua require("dap").step_over()<cr>', "step over" },
		["J"] = { ':lua require("dap").continue()<cr>', "continue" },
		["c"] = { ':lua require("dap").continue()<cr>', "continue" },
		["k"] = { ':lua require("dap").step_back()<cr>', "step back" },
		["K"] = { ':lua require("dap").reverse_continue()<cr>', "reverse continue" },
		["i"] = { ':lua require("dap").step_into()<cr>', "step into" },
		["o"] = { ':lua require("dap").step_out()<cr>', "step out" },
		["r"] = { ':lua require("dap").run_last()<cr>', "run last" },
		["h"] = { ':lua require("dap").run_to_cursor()<cr>', "run to cursor" },
		["D"] = { ':lua require("dap").terminate()<cr>', "terminate" },
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>', "Comment" },
	["lF"] = { ":'<,'>lua vim.lsp.buf.range_formatting()<cr>", "Range Format" },
	g = {
		name = "Git",
		y = { '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', "Get link" },
		Y = {
			'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			"Open in browser",
		},
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
