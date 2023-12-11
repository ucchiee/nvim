vim.cmd([[
let g:mkdp_filetypes = ['markdown', 'dot']
let g:mkdp_command_for_global = 1
let g:mkdp_auto_close = 0
]])

_G.markdown_preview_dot = function()
	-- Create tmp file
	local tmp_file = os.tmpname()

	-- copy content of current buffer to the tmp file
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local file, err = io.open(tmp_file, "w")
	if file == nil then
		print("Error opening file: " .. err)
	end
	file:write("```dot\n") -- preppend "```dot"
	for _, line in ipairs(lines) do
		file:write(line .. "\n")
	end
	file:write("```\n") -- append '```'
	file:close()

	-- open, set filetype, and preview Markdown
	vim.cmd("e " .. tmp_file)
	vim.cmd("set filetype=markdown")
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_create_autocmd("BufDelete", {
		buffer = bufnr,
		once = true,
		callback = function()
			os.remove(tmp_file)
		end,
	})
	vim.cmd("MarkdownPreview")
end

-- Configure keybinding
vim.api.nvim_set_keymap("n", "<leader>md", "<cmd>lua markdown_preview_dot()<CR>", { noremap = true, silent = true })
