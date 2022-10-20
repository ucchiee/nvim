local ok, dap_python = pcall(require, "dap-python")
if not ok then
	return
end

local home_dir = os.getenv("HOME")
dap_python.setup(home_dir .. "/.asdf/shims/python")
