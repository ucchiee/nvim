local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local black_config = { "--fast", "-l", "120" }
local flake8_config = {
	"--max-line-length",
	"120",
	"--ignore=E402,E203,E501,W503",
	"--exclude=__init__.py",
}
local isort_config = { "--stdout", "--profile", "black", "-" }

null_ls.setup({
	debug = false,
	sources = {
    -- formatter
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = black_config }),
		formatting.isort.with({ extra_args = isort_config }),
		formatting.stylua,
    -- linter
		diagnostics.flake8.with({ extra_args = flake8_config }),
	},
})
