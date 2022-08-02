local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
	return
end

indent_blankline.setup({
	-- space_char_blankline = " ",
  char = "",
  context_char = "┃",
	show_current_context = true,
	show_current_context_start = false,
})
vim.cmd([[highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine]])
