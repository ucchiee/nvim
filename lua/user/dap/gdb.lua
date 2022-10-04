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

-- useful function
local get_executable = function()
	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
end
local get_args = function()
	return { vim.fn.input("Arguments of executable: ") }
end
local get_pid = function()
	return vim.fn.input("pid to attach: ")
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
		program = get_executable,
		args = get_args,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Launch file (stopAtConnect)",
		type = "cppdbg",
		request = "launch",
		program = get_executable,
		args = get_args,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		stopAtConnect = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = get_executable,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		-- If you get an "Operation not permitted" error using this, try disabling YAMA:
		--  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		name = "Attach to process",
		type = "cppdbg", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
		request = "attach",
		-- processId = require("dap.utils").pick_process,
		processId = get_pid,
		program = get_executable,
		args = {},
		stopAtConnect = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
dap.configurations.c = dap.configurations.cpp
