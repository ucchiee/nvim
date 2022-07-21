local colorscheme = "gruvbox-material"
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
