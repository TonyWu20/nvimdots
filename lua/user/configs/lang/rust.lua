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
				["rust_analyzer"] = {
					checkOnSave = {
						allFeatures = true,
						command = "cargo check",
					},
					procMacro = {
						enable = true,
					},
					completion = {
						autoimport = true,
					},
				},
			},
		},
	}

	require("modules.utils").load_plugin("rustaceanvim", nil, true)
end
