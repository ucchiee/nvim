local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = true,
  always_visible = false,
  padding = { left = 1, right = 0 },
  cond = hide_in_width,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  -- fmt = function(str)
  -- 	return "-- " .. str .. " --"
  -- end,
}

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
  padding = 0,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "", -- 
}

-- cool function for progress
local progress = function()
  return "%l/%L:%c"
end

--[[ local separator = function() ]]
--[[   return "%=" ]]
--[[ end ]]

local lsp_indicator = {
  function()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return "(" .. client.name .. ")"
      end
    end
    return msg
  end,
  --[[ icon = " LSP:", ]]
  --[[ color = { fg = "#ffffff", gui = "bold" }, ]]
  color = { gui = "bold" },
  padding = 0,
  cond = hide_in_width,
}

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

local mixed_indent = {
  function()
    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = vim.fn.search(space_pat, 'nwc')
    local tab_indent = vim.fn.search(tab_pat, 'nwc')
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line
    if not mixed then
      mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
      mixed = mixed_same_line > 0
    end
    if not mixed then return '' end
    if mixed_same_line ~= nil and mixed_same_line > 0 then
      return 'MI:' .. mixed_same_line
    end
    local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
    local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
    if space_indent_cnt > tab_indent_cnt then
      return 'MI:' .. tab_indent
    else
      return 'MI:' .. space_indent
    end
  end,
  color = { fg = "#ffffff", gui = "bold" }
}

local trailing_white = {
  function()
    local space = vim.fn.search([[\s\+$]], 'nwc')
    return space ~= 0 and "TW:" .. space or ""
  end,
  color = { fg = "#ffffff", gui = "bold" }
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox-material",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diff },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = {
      diagnostics,
      trailing_white,
      mixed_indent,
      { "encoding", padding = { left = 1, right = 0 } },
      {
        "fileformat",
        icons_enabled = true,
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_y = { filetype, lsp_indicator },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
