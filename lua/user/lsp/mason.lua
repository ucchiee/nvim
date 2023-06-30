local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end
local mason_config_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_config_ok then
  return
end
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    border = "rounded",
  },
})

mason_lspconfig.setup({
  ensure_installed = { "lua-language-server", "pyright", "gopls", "clangd", "cpptools"},
  automatic_installation = false,
})

local function set_buf_key(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local ok, navic = pcall(require, "nvim-navic")
local navic_loaded = false
if ok then
  navic_loaded = true
end

local function on_attach(client, bufnr)
  set_buf_key(bufnr)
  --[[ lsp_highlight_document(client) ]]
  if navic_loaded and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers({
  function(server)
    local opt_ok, opts = pcall(require, "user.lsp.settings." .. server)
    if not opt_ok then
      opts = {}
    end
    opts.on_attach = on_attach
    opts.capabilities = capabilities
    lspconfig[server].setup(opts)
  end,
})
