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

local navic_ok, navic = pcall(require, "nvim-navic")
local navic_status = {
  function()
    if navic_ok then
      return navic.get_location({ highlight = true })
    else
      return ""
    end
  end,
  color = { fg = "#ffffff", gui = "bold" },
  padding = 3,
  cond = navic.is_available,
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
    lualine_c = { diff, navic_status },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = {
      diagnostics,
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
