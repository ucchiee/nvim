local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "python", "c", "cpp", "lua", "go", "yaml", "json", "vim", "html", "css", "make", "markdown"}, -- A list of parser names, or "all"
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	auto_install = true,
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		-- additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
})

--[[ local ok, spellsitter = pcall(require, "spellsitter")
if not ok then
	return
end

spellsitter.setup()

local my_augroup = vim.api.nvim_create_augroup("my_augroup", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = {}, -- disable spellchecking for these filetypes
-- 	command = "setlocal nospell",
-- 	group = my_augroup,
-- })
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*", -- disable spellchecking in the embeded terminal
	command = "setlocal nospell",
	group = my_augroup,
}) ]]
