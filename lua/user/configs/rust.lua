return function()
	vim.g.rustaceanvim = {
		-- Disable automatic DAP configuration to avoid conflicts with previous user configs
		dap = {
			adapter = false,
			configuration = false,
			autoload_configurations = false,
		},
		server = {
			default_settings = {
<<<<<<< HEAD:lua/user/configs/rust.lua
				["rust-analyzer"] = {
					checkOnSave = true,
					check = { features = "all", command = "clippy" },
					procMacro = {
						enable = true,
					},
					completion = {
						autoimport = true,
					},
					files = {
						excludeDirs = { ".direnv" },
					},
				},
			},
		},
	}
end
