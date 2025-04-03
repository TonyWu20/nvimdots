local editor = {}

editor["echasnovski/mini.surround"] = {
	version = false,
	config = require("configs.editor.surround"),
}

editor["keaising/im-select.nvim"] = {
	lazy = false,
	opts = {
		default_im_select = "keyboard-us",
		default_command = "fcitx5-remote",
	},
}

editor["rainzm/flash-zh.nvim"] = {
	event = "VeryLazy",
	dependencies = "folke/flash.nvim",
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash-zh").jump({
					chinese_only = false,
				})
			end,
			desc = "Flash between Chinese",
		},
	},
}

editor["noearc/jieba.nvim"] = { dependencies = { "noearc/jieba-lua" }, opts = {} }

return editor
