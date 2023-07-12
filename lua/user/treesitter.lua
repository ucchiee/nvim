local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"python",
		"c",
		"cpp",
		"lua",
		"go",
		"yaml",
		"json",
		"vim",
		"html",
		"css",
		"make",
		"markdown",
		"markdown_inline",
	}, -- A list of parser names, or "all"
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	auto_install = true,
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = function(_, buf) -- first arg is `lang`
			local max_size = 100 * 1024
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_size then
				return true
			end
		end,
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
