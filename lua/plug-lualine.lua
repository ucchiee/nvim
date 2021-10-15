local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

local function line_progress() return '%3p%%' end

-- almost onedark
local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#f3f99d',
  cyan = '#9aedfe',
  darkblue = '#081633',
  green = '#5af78e',
  orange = '#FF8800',  -- this is not from onedark
  violet = '#C678DD',
  magenta = '#ff6ac1',
  blue = '#57c7ff',
  red = '#ff5c57'
}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      'filename',
      {
        'diff',
        -- Is it me or the symbol for modified us really weird
        symbols = {added = ' ', modified = ' ', removed = ' '},
        color_added = colors.green,
        color_modified = colors.orange,
        color_removed = colors.red,
        condition = conditions.hide_in_width
      }
    },
    lualine_x = {{ 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} }, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {line_progress},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "chadtree" }
}
