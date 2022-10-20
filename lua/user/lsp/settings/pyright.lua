local home_dir = os.getenv("HOME")
return {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
				extraPaths = {
					home_dir .. "/.asdf/installs/python/3.9.5/lib/python3.9/site-packages",
					home_dir .. "/.asdf/installs/python/3.9.12/lib/python3.9/site-packages",
				}, -- need to fix (do not use constant)
			},
		},
	},
}
