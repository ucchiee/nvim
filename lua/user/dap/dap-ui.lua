local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
local status_ok_ui, dapui = pcall(require, "dapui")
if not status_ok_ui then
	return
end

-- default setting from github
dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
--[[ dap.listeners.before.event_terminated["dapui_config"] = function() ]]
--[[ 	dapui.close() ]]
--[[ end ]]
--[[ dap.listeners.before.event_exited["dapui_config"] = function() ]]
--[[ 	dapui.close() ]]
--[[ end ]]
