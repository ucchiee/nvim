local ok, scrollbar = pcall(require, "scrollbar")
if not ok then
	return
end
scrollbar.setup({
	handle = {
		color = "#7c6f64",
	},
	marks = {
		Search = { color = "#e78a4e" },
		Error = { color = "#ea6962" },
		Misc = { color = "#d3869b" },
	},
})

require("scrollbar.handlers.search").setup()
