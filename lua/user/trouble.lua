local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup({
	auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
})
