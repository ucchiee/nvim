local colorscheme = "catppuccin-frappe"
-- local colorscheme = "material"
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_ui_contrast = "high"
-- vim.g.gruvbox_material_statusline_style = "default"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local status_catppuccin, catppuccin = pcall(require, "catppuccin")
if not status_catppuccin then
	vim.notify("Cannot load catppuccin")
	return
end

catppuccin.setup({
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		fidget = true,
		lsp_saga = true,
		lsp_trouble = true,
		which_key = true,
	},
})
