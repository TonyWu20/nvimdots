-- User keymap overrides. Each user.keymap.<scope> file returns a table of
-- mappings passed to modules.utils.keymap.replace():
--   * value = map_rhs table  -> replace the base keymap
--   * value = "" / false     -> remove the base keymap
--
-- See `lua/user_template/keymap/` for the full template.

local function load(scope)
	local ok, mod = pcall(require, "user.keymap." .. scope)
	if ok and type(mod) == "table" then
		return mod
	end
	return {}
end

local completion = load("completion")
local completion_plug = completion.plug_map or {}

return vim.tbl_extend(
	"force",
	load("core"),
	completion_plug,
	load("editor"),
	load("lang"),
	load("tool"),
	load("ui")
)
