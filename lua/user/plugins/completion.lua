local completion = {}
completion["hrsh7th/nvim-cmp"] = {
	dependencies = {
		{
			"liubianshi/cmp-lsp-rimels",
			commit = "96975c5",
			config = require("configs.completion.rimels"),
		},
	},
}

return completion
