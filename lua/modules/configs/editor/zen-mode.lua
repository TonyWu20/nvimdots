return function()
	require("modules.utils").load_plugin("zen-mode", {
		window = {
			backdrop = 0.95,
			width = 85,
			height = 0.8,
			options = {
				list = false,
				-- foldcolumn = "0",
				-- signcolumn = "no",
				cursorcolumn = false,
				cursorline = false,
			},
		},
		plugins = {
			tmux = {
				enabled = true,
			},
			wezterm = {
				enabled = true,
				font = "+0",
			},
		},
	})
end
