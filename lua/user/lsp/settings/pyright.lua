local home_dir = os.getenv("HOME")
return {
	settings = {
		python = {
			analysis = {
				extraPaths = {
					home_dir .. "/.asdf/installs/python/3.11.1/lib/python3.11/site-packages",
					home_dir .. "/.asdf/installs/python/3.9.12/lib/python3.9/site-packages",
				}, -- need to fix (do not use constant)
			},
		},
	},
}
