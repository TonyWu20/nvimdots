-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["colorscheme"] = "catppuccin-frappe"

settings["use_copilot"] = false

-- settings["dashboard_image"] = {
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠈⠐⠙⢿⣿⣿⣇⣀⢀⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⡿⢿⣿⣿⠁⠀⠙⢿⣿⡇⠀⠀⠀⠈⢻⣿⣿⢻⠿⣿⣿⢽⣯⣷⣿⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⡱⣞⣳⣎⣿⠀⠀⠀⠀⠻⠇⣠⣤⣴⣶⣶⣬⣝⠻⣾⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣷⣿⣾⣾⣿⠀⢀⣤⣶⣶⣿⣿⡟⠉⠀⠈⠙⣿⣷⢹⣿⣿⣿⣿⣿⡟⠉⠉⢻⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣯⣛⡟⠰⠛⠿⣿⡿⠋⠉⢰⠀⠀⠀⠀⢸⣿⢸⣿⣿⣿⠿⢿⣇⠀⠀⢸⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣷⣟⣿⣶⡞⠀⠀⠀⠀⢨⠀⠀⠀⠀⠑⠦⢔⣠⡿⠃⠀⠸⣿⡗⣁⡀⡊⠿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣷⣿⣿⣿⣿⡖⠀⠀⢀⣠⣿⣷⣤⣤⣴⡾⠟⠋⢁⣤⡀⠀⣰⣿⡷⣯⢨⣟⣻⣜⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⡏⠀⠀⠘⣧⡀⠀⠀⠉⣭⣉⢩⠁⠀⠀⣶⣾⣿⣿⣷⣝⠻⣿⣿⠏⠀⠈⢩⡾⠋⠋⢿⣿⣿]],
-- 	[[⣿⣿⣿⣷⡀⢀⣴⣿⣿⣷⣦⣬⡛⣿⣦⣤⣤⣾⣿⣿⣿⣿⣿⣿⣷⡜⠁⠀⠀⣠⣿⡇⠀⠀⣼⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢿⣿⡟⠛⠛⠟⣽⣿⣿⣿⣿⣿⣿⢠⡴⣯⣭⡻⣿⣶⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣯⡷⣿⣿⣿⡿⠛⠈⢿⠇⠀⠀⠰⠛⠛⠻⢿⣿⣿⠟⣼⣗⡿⣾⢟⣾⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡀⠀⢀⡀⠀⢀⠀⠀⠀⠀⢀⣩⣵⣾⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
-- 	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
-- }

-- Set the language servers that will be installed during bootstrap here.
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
settings["lsp_deps"] = function(defaults)
	return {
		"bashls",
		"html",
		"jsonls",
		"lua_ls",
		"pylsp",
	}
end
-- Set the general-purpose servers that will be installed during bootstrap here.
-- Check the below link for all supported sources.
-- in `code_actions`, `completion`, `diagnostics`, `formatting`, `hover` folders:
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
---@type string[]
settings["null_ls_deps"] = function(defaults)
	return {
		"clang_format",
		"prettier",
		"shfmt",
		"stylua",
		"vint",
	}
end

settings["disabled_plugins"] = {
	"ray-x/go.nvim",
}

return settings
