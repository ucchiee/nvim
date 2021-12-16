require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    ['/'] = {":Commentary<CR>"        , 'Comment'},
    S = {":Startify<CR>"              , "Start Screen"},
    d = {":FloatermNew lazydocker<CR>", "lazydocker"},
    e = {'<cmd>CHADopen<cr>'          , 'CHADTree'},
    f = {":Files<CR>"                 , "Files"},
    g = {":FloatermNew lazygit<CR>"   , "lazygit"},
    r = {":Ranger<CR>"                , "Ranger"},
    t = {":Rg<CR>"                    , "ripgrep"},
    v = {"<C-W>v"                     , "split vertically"},
    s = {
      name = "+search",
      ['/'] = { ":History/<CR>" , "search history" },
      [';'] = { ":Commands<CR>" , "commands" },
      a = { ":Ag<CR>"           , "text Ag" },
      B = { ":BLines<CR>"       , "current buffer" },
      b = { ":Buffers<CR>"      , "open buffers" },
      c = { ":Commits<CR>"      , "commits" },
      C = { ":BCommits<CR>"     , "buffer commits" },
      f = { ":Files<CR>"        , "files" },
      g = { ":GFiles<CR>"       , "git files" },
      G = { ":GFiles?<CR>"      , "modified git files" },
      H = { ":History<CR>"      , "file history" },
      h = { ":History:<CR>"     , "command history" },
      l = { ":Lines<CR>"        , "lines" } ,
      m = { ":Marks<CR>"        , "marks" } ,
      M = { ":Maps<CR>"         , "normal maps" } ,
      p = { ":Helptags<CR>"     , "help tags" } ,
      P = { ":Tags<CR>"         , "project tags" },
      s = { ":Snippets<CR>"     , "snippets" },
      S = { ":Colors<CR>"       , "color schemes" },
      t = { ":Rg<CR>"           , "text Rg" },
      T = { ":BTags<CR>"        , "buffer tags" },
      w = { ":Windows<CR>"      , "search windows" },
      y = { ":Filetypes<CR>"    , "file types" },
      z = { ":FZF<CR>"          , "FZF" },
    },
    g = {
      name = "+git",
      l = { ":FloatermNew lazygit<CR>"               , "lazygit" },
      n = { ":Gitsigns next_hunk<CR>"                , "next hunk" },
      p = { ":Gitsigns prev_hunk<CR>"                , "prev hunk" },
      s = { ":Gitsigns stage_hunk<CR>"               , "stage hunk" },
      u = { ":Gitsigns undo_stage_hunk<CR>"          , "undo stage hunk" },
      S = { ":Gitsigns stage_buffer<CR>"             , "stage buffer" },
      U = { ":Gitsigns reset_buffer_index<CR>"       , "reset buffer index" },
      d = { ":Gitsigns reset_hunk<CR>"               , "reset hunk" },
      D = { ":Gitsigns reset_buffer<CR>"             , "reset buffer" },
      v = { ":Gitsigns preview_hunk<CR>"             , "preview hunk" },
      b = { ":Gitsigns blame_line<CR>"               , "blame line" },
      B = { ":Gitsigns toggle_current_line_blame<CR>", "toggle current line blame" },
      t = { ":Gitsigns diffthis<CR>"                 , "diff this" },
      w = { ":Gitsigns toggle_word_diff<CR>"         , "toggle word diff" },
      a = { ":Gitsigns get_actions<CR>"              , "get actions" },
    },
    l = {
      name = "+lsp",
      ['.'] = { ":CocConfig<CR>"                      , "config" },
      [';'] = { "<Plug>(coc-refactor)"            , "refactor" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>"              , "code action" },
      A = { "<Plug>(coc-codeaction-selected)"     , "selected action" },
      b = { ":CocNext<CR>"                            , "next action" },
      B = { ":CocPrev<CR>"                            , "prev action" },
      c = { ":CocList commands<CR>"                   , "commands" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>"              , "definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>"             , "declaration" },
      e = { ":CocList extensions<CR>"                 , "extensions" },
      f = { "<Plug>(coc-format-selected)"         , "format selected" },
      F = { "<Plug>(coc-diagnostic-next)"                  , "format" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>"              , "hover" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>"          , "implementation" },
      I = { "<cmd>lua vim.diagnostic.open_float()<CR>"                , "diagnostics" },
      j = { "<Plug>(coc-float-jump)"              , "float jump" },
      l = { "<Plug>(coc-codelens-action)"         , "code lens" },
      n = { "<Plug>(coc-diagnostic-prev)"         , "next diagnostic" },
      N = { "<Plug>(coc-diagnostic-next-error)"   , "next error" },
      o = { ":Vista!!<CR>"                            , "outline" },
      O = { ":CocList outline<CR>"                    , "search outline" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>"         , "prev diagnostic" },
      P = { "<Plug>(coc-diagnostic-prev-error)"   , "prev error" },
      q = { "<Plug>(coc-fix-current)"             , "quickfix" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>"              , "references" },
      R = { "<cmd>lua vim.lsp.buf.rename()<CR>"                  , "rename" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>"                 , "signature" },
      S = { ":CocList snippets<CR>"                   , "snippets" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>"         , "type definition" },
      u = { ":CocListResume<CR>"                      , "resume list" },
      U = { ":CocUpdate<CR>"                          , "update CoC" },
      z = { ":CocDisable<CR>"                         , "disable CoC" },
      Z = { ":CocEnable<CR>"                          , "enable CoC" },
    },
    j = {
      name = "+terminal",
      [';'] = { ":FloatermNew<CR>"                                      , "terminal" },
      l = { ":FloatermNew --autoclose=0 python %<CR>"                   , "python %" },
      c = { ":FloatermNew --autoclose=0 g++ -o program %; ./program<CR>", "g++ %;./a.out" },
      x = { ":FloatermNew --autoclose=0 python -m cProfile %<CR>"       , "python -m Cprofile %" },
      f = { ":FloatermNew fzf<CR>"                                      , "fzf" },
      g = { ":FloatermNew lazygit<CR>"                                  , "git" },
      d = { ":FloatermNew lazydocker<CR>"                               , "docker" },
      n = { ":FloatermNew node<CR>"                                     , "node" },
      m = { ":FloatermNew --autoclose=0 make run<CR>"                   , "make run" },
      N = { ":FloatermNew nnn<CR>"                                      , "nnn" },
      p = { ":FloatermNew python<CR>"                                   , "python" },
      i = { ":FloatermNew ipython<CR>"                                  , "ipython" },
      r = { ":FloatermNew ranger<CR>"                                   , "ranger" },
      t = { ":FloatermToggle<CR>"                                       , "toggle" },
      b = { ":FloatermNew btm<CR>"                                      , "bottom" },
      s = { ":FloatermNew ncdu<CR>"                                     , "ncdu" },
    },
    m = {
      name = "+markdown",
      p = { "<Plug>MarkdownPreviewToggle", "preview" },
    }
  },
})

vim.api.nvim_command('highlight default link WhichKey          Operator')
vim.api.nvim_command('highlight default link WhichKeySeperator DiffAdded')
vim.api.nvim_command('highlight default link WhichKeyGroup     Identifier')
vim.api.nvim_command('highlight default link WhichKeyDesc      Function')
