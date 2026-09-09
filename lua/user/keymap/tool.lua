-- Remove keymaps for sniprun (disabled via settings["disabled_plugins"])
-- and codecompanion (gated off by settings["use_chat"] = false).
return {
	["v|<leader>r"] = false,
	["n|<leader>r"] = false,
	["n|<leader>cs"] = false,
	["nv|<leader>cc"] = false,
	["nv|<leader>ck"] = false,
	["v|<leader>ca"] = false,
}
