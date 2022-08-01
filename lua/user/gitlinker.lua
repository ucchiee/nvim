local ok, gitlinker = pcall(require, "gitlinker")
if not ok then
	return
end

gitlinker.setup()
