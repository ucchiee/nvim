local ok, better_escape = pcall(require, "better_escape")
if not ok then
	return
end

better_escape.setup({
  mapping = {"jk", "kj"}, -- a table with mappings to use
})
