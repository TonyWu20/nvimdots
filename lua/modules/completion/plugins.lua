local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = conf.nvim_lsp,
	dependencies = {
		{ "creativenull/efmls-configs-nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", config = conf.mason_install },
		{ "glepnir/lspsaga.nvim", config = conf.lspsaga },
		{ "ray-x/lsp_signature.nvim" },
	},
}
completion["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", config = conf.luasnip, dependencies = { "rafamadriz/friendly-snippets" } },
		{ "onsails/lspkind.nvim" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "windwp/nvim-autopairs", config = conf.autopairs },
		-- { "tzachar/cmp-tabnine", build = "./install.sh", config = conf.tabnine },
	},
}
completion["L3MON4D3/LuaSnip"] = {
	after = "nvim-cmp",
	config = conf.luasnip,
	requires = "rafamadriz/friendly-snippets",
}
completion["windwp/nvim-autopairs"] = {
	after = "nvim-cmp",
	config = conf.autopairs,
}
completion["dcampos/nvim-snippy"] = {
	opt = true,
	config = conf.nvim_snippy,
}
-- completion["zbirenbaum/copilot.lua"] = {
-- 	event = "VimEnter",
-- 	config = function()
-- 		vim.defer_fn(function()
-- 			require("copilot").setup()
-- 		end, 100)
-- 	end,
-- }
-- completion["zbirenbaum/copilot-cmp"] = {
-- 	after = { "copilot.lua", "nvim-cmp" },
-- 	config = function()
-- 		require("copilot_cmp").setup()
-- 	end,
-- }

return completion
