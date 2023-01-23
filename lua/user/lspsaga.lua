local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  return
end

lspsaga.setup({
  border_style = "rounded",
  symbol_in_winbar = {
    enable = false,
  },
})
