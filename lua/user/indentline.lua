local status_ok, indentline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indentline.setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = false,
	show_current_context_start = false,
	show_end_of_line = true,
})
