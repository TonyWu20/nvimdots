local editor = {}

editor["echasnovski/mini.surround"] = {
	version = false,
	config = require("configs.editor.surround"),
}

editor["keaising/im-select.nvim"] = {
	lazy = false,
	opts = {
		default_im_select = "keyboard-us",
		default_command = "macism",
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

editor["TonyWu20/jieba.vim"] = {
	build = "./build.sh",
	init = function()
		vim.g.jieba_vim_lazy = 1
		vim.g.jieba_vim_keymap = 1
	end,
}

return editor
