local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	dashboard.button("=", "=============================================", ""),
	dashboard.button("i", "  Neovim Config", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("d", "  Dotfiles README", ":e ~/dotfiles/README.md <CR>"),
	dashboard.button("z", "  Zsh Config", ":e ~/dotfiles/zsh/.config/zsh/zshrc <CR>"),
	dashboard.button("a", "  Alacritty Config", ":e ~/dotfiles/alacritty/.config/alacritty/alacritty.yml <CR>"),
	dashboard.button("y", "  Kitty Config", ":e ~/dotfiles/kitty/.config/kitty/kitty.conf <CR>"),
	dashboard.button("w", "  Wezterm Config", ":e ~/dotfiles/wezterm/wezterm.lua <CR>"),
	dashboard.button("s", "  Ssh Config", ":e ~/.ssh/config <CR>"),
	dashboard.button("t", "  Tmux Config", ":e ~/dotfiles/tmux/.config/tmux/tmux.conf <CR>"),
}

local function footer()
	-- local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	return datetime
		-- .. "   "
		-- .. total_plugins
		-- .. " plugins"
		.. "   v"
		.. vim.version().major
		.. "."
		.. vim.version().minor
		.. "."
		.. vim.version().patch
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
