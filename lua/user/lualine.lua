local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")
local default_status_colors = { saved = "#228B22", modified = "#C70039" }

function custom_fname:init(options)
	custom_fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ bg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ bg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function custom_fname:update_status()
	local data = custom_fname.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = true,
	always_visible = false,
	padding = { left = 1, right = 0 },
	cond = hide_in_width,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	-- fmt = function(str)
	-- 	return "-- " .. str .. " --"
	-- end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	return "%p%%/%L"
end

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { custom_fname, diff },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = {
			diagnostics,
			{ "encoding", padding = { left = 1, right = 0 } },
			{
				"fileformat",
				icons_enabled = true,
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
				padding = { left = 1, right = 0 },
			},
			filetype,
		},
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
