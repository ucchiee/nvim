local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local handle = io.popen("uname -s")
local os = handle:read("*a")
handle:close()

local dap_path = ".config/nvim/dap-related/extension/debugAdapters/bin/OpenDebugAD7"
if string.match(os, "Linux") then
	dap_path = "/home/uu/" .. dap_path
elseif string.match(os, "Darwin") then
	dap_path = "/Users/uu/" .. dap_path
end

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = dap_path,
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = function()
			return { vim.fn.input("Arguments of executable: ") }
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
