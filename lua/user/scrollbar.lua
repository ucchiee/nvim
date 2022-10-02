---@diagnostic disable: redefined-local
local ok, scrollbar = pcall(require, "scrollbar")
if not ok then
	return
end
scrollbar.setup({
	--[[ handle = { ]]
	--[[ 	color = "#7a6f6f", ]]
	--[[ }, ]]
	marks = {
		Search = { color = "#e78a4e" },
		Error = { color = "#ea6962" },
		Misc = { color = "#d3869b" },
	},
})

local ok, hlslens = pcall(require, "hlslens")
if not ok then
	vim.notify("hlslens cannot be loaded")
	return
end
hlslens.setup({
	calm_down = false,
	nearest_only = true,
	nearest_float_when = "auto",
})

--[[ require("scrollbar.handlers.search").setup() ]]
