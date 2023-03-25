local ok, neogen = pcall(require, "neogen")
if not ok then
	return
end

neogen.setup({
	snippet_engine = "luasnip",
	languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      }
    }
	},
})
