return function()
	require("modules.utils").load_plugin("zen-mode", {
		window = {
			backdrop = 0.95,
			width = 85,
			height = 1.0,
			options = {
				list = false,
				-- foldcolumn = "0",
				-- signcolumn = "no",
				cursorcolumn = true,
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
