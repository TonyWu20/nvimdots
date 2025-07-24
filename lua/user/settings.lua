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

settings["lsp_deps"] = function(default)
	return {
		"bashls",
		"jsonls",
		"lua_ls",
		"pylsp",
		"fish-lsp",
		"tinymist",
	}
end

settings["null_ls_deps"] = function(default)
	return {
		"clang_format",
		"prettier",
		"shfmt",
		"stylua",
		"vint",
	}
end

return settings
