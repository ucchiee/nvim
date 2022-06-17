local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local handle = io.popen("uname -s")
local result = handle:read("*a")
handle:close()

local home_dir
if result == "Linux" then
	home_dir = "/home/uu/"
elseif result == "Darwin" then
	home_dir = "/Users/uu/"
end

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = home_dir .. ".config/nvim/dap-related/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}
dap.configurations.c = dap.configurations.cpp
