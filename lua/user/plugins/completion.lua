local completion = {}
completion["hrsh7th/nvim-cmp"] = {
	dependencies = {
		{
			"liubianshi/cmp-lsp-rimels",
			keys = { { "<localleader>f", mode = "i" } },
			config = require("configs.completion.rimels"),
		},
	},
}

return completion
