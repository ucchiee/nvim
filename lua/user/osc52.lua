local is_ok, osc52 = pcall(require, "osc52")

if not is_ok then
  vim.notify("osc52 failed")
	return
end

osc52.setup({
	max_length = 0, -- Maximum length of selection (0 for no limit)
	silent = false, -- Disable message on successful copy
	trim = false, -- Trim surrounding whitespaces before copy
})

vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
vim.keymap.set("v", "<leader>c", require("osc52").copy_visual)

function COPY()
	if vim.v.event.operator == "y" and vim.v.event.regname == "" then
		require("osc52").copy_register("+")
	end
end

vim.api.nvim_create_autocmd("TextYankPost", { callback = COPY })
