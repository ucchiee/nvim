local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
	return
end

lspsaga.setup({
	symbol_in_winbar = {
		enable = false,
	},
	ui = {
		theme = "round",
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		colors = {
			--float window normal background color
			normal_bg = "#32302f",
			--title background color
			--[[ title_bg = "#afd700", ]]
			--[[ red = "#ea6962", ]]
			--[[ magenta = "#ea6962", -- same as red ]]
			--[[ orange = "#ea8a42", ]]
			--[[ yellow = "#d8a567", ]]
			--[[ green = "#a9b665", ]]
			--[[ cyan = "#36d0e0", -- not material ]]
			--[[ blue = "#61afef", ]]
			--[[ purple = "#d3869b", ]]
			--[[ white = "#ddc7a1", ]]
			--[[ black = "#282828", ]]
		},
	},
})
