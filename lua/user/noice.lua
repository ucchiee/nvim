local ok, noice = pcall(require, "noice")
if not ok then
	return
end
noice.setup({
	cmdline = {
		enabled = true, -- enables the Noice cmdline UI
	},
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = true, -- enables the Noice messages UI
	},
	popupmenu = {
		enabled = true, -- enables the Noice popupmenu UI
	},
	lsp = {
		progress = {
			enabled = false,
		},
		override = {
			-- override the default lsp markdown formatter with Noice
			["vim.lsp.util.convert_input_to_markdown_lines"] = false,
			-- override the lsp markdown formatter with Noice
			["vim.lsp.util.stylize_markdown"] = false,
			-- override cmp documentation with Noice (needs the other options to work)
			["cmp.entry.get_documentation"] = false,
		},
		hover = {
			enabled = false,
			silent = false, -- set to true to not show a message if hover is not available
			view = nil, -- when nil, use defaults from documentation
			---@type NoiceViewOptions
			opts = {}, -- merged with defaults from documentation
		},
		signature = {
			enabled = false,
			auto_open = {
				enabled = false,
				trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
			},
		},
		message = {
			-- Messages shown by lsp servers
			enabled = true,
			view = "notify",
			opts = {},
		},
	},
	---@type NoicePresets
	presets = {
		-- you can enable a preset by setting it to true, or a table that will override the preset config
		-- you can also add custom presets that you can enable/disable with enabled=true
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = false, -- long messages will be sent to a split
		inc_rename = true, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
		{
			view = "mini",
			filter = { event = "msg_showmode" },
		},
	},
})
