local ok, signature = pcall(require, "lsp_signature")
if not ok then
	return
end

signature.setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded",
	},
	toggle_key = "<M-o>",
})
