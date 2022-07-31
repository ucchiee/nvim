local ok, gitlinker = pcall(require, "gitlinker")
if not ok then
	return
end

gitlinker.setup()

vim.api.nvim_set_keymap('n', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', {desc="Get link"})
-- vim.keymap.set('v', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', {})
