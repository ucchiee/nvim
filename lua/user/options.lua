local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 4,                           -- is one of my fav
  sidescrolloff = 4,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("tab:  ")
vim.opt.listchars:append("trail:-")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("lang en_US.UTF-8")  -- need this option to paste japanese
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
-- vim.cmd([[
--   set nocp                    " 'compatible' is not set
--   filetype plugin on          " plugins are enabled
--   let g:netrw_banner=0        " disable annoying banner
--   let g:netrw_browse_split=4  " open in prior window
--   let g:netrw_altv=1          " open splits to the right
--   let g:netrw_liststyle=3     " tree view
--   let g:netrw_list_hide=netrw_gitignore#Hide()
--   let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
-- ]])

-- IME settings
-- TODO:this assumes MacOS, need to check OS
-- vim.cmd([[
-- if executable('im-select')
--   autocmd InsertLeave * :call system('im-select com.apple.keylayout.ABC')
--   autocmd CmdlineLeave * :call system('im-select com.apple.keylayout.ABC')
-- endif
-- ]])

-- cursor settings
-- vim.cmd([[
--   let &t_SI .= "\e[5 q"   " Start Insert
--   let &t_SR .= "\e[3 q"   " Start Replace
--   let &t_EI .= "\e[1 q"   " End Insert/Replace
-- ]])
