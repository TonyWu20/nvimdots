return function()
	require("modules.utils").gen_lspkind_hl()

	local icons = {
		cmp = require("modules.utils.icons").get("cmp", true),
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		kind = require("modules.utils.icons").get("kind", true),
		type = require("modules.utils.icons").get("type", true),
		ui = require("modules.utils.icons").get("ui", true),
	}

	local function set_sidebar_icons()
		-- Set icons for sidebar
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error_alt,
					[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning_alt,
					[vim.diagnostic.severity.INFO] = icons.diagnostics.Information_alt,
					[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint_alt,
				},
			},
		})
	end

	set_sidebar_icons()

<<<<<<< HEAD
	require("modules.utils").load_plugin("lspsaga", {
		-- Breadcrumbs: https://nvimdev.github.io/lspsaga/breadcrumbs/
		symbol_in_winbar = {
			enable = false,
			separator = " " .. icons.ui.Separator,
			hide_keyword = false,
			show_file = false,
			folder_level = 1,
			color_mode = true,
			delay = 100,
		},
		-- Callhierarchy: https://nvimdev.github.io/lspsaga/callhierarchy/
		callhierarchy = {
			layout = "float",
||||||| parent of 41c2f00 (Merge branch 'main')
	require("lspsaga").setup({
		preview = {
			lines_above = 1,
			lines_below = 17,
		},
		scroll_preview = {
			scroll_down = "<C-j>",
			scroll_up = "<C-k>",
		},
		request_timeout = 3000,
		finder = {
=======
	require("lspsaga").setup({
		scroll_preview = {
			scroll_down = "<C-j>",
			scroll_up = "<C-k>",
		},
		request_timeout = 3000,
		finder = {
			silent = true,
			default = "def+ref+imp",
			layout = "float",
			filter = {},
>>>>>>> 41c2f00 (Merge branch 'main')
			keys = {
<<<<<<< HEAD
				edit = "e",
				vsplit = "v",
				split = "s",
||||||| parent of 41c2f00 (Merge branch 'main')
				jump_to = "e",
				expand_or_jump = "<CR>",
				vsplit = "s",
				split = "i",
=======
				shuttle = "[]",
				toggle_or_open = "<CR>",
				jump_to = "e",
				vsplit = "v",
				split = "s",
>>>>>>> 41c2f00 (Merge branch 'main')
				tabe = "t",
<<<<<<< HEAD
				quit = "q",
				shuttle = "[]",
				toggle_or_req = "u",
				close = "<Esc>",
||||||| parent of 41c2f00 (Merge branch 'main')
				quit = { "q", "<ESC>" },
				close_in_preview = "<ESC>",
=======
				tabnew = "n",
				quit = "q",
				close = "<Esc>",
>>>>>>> 41c2f00 (Merge branch 'main')
			},
		},
<<<<<<< HEAD
		-- Code Action: https://nvimdev.github.io/lspsaga/codeaction/
||||||| parent of 41c2f00 (Merge branch 'main')
		definition = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>s",
			tabe = "<C-c>t",
			quit = "q",
		},
=======
		definition = {
			keys = {
				edit = "<C-c>o",
				vsplit = "<C-c>v",
				split = "<C-c>s",
				tabe = "<C-c>t",
				close = "<C-c>q",
				quit = "q",
			},
		},
>>>>>>> 41c2f00 (Merge branch 'main')
		code_action = {
			num_shortcut = true,
<<<<<<< HEAD
			only_in_cursor = false,
			show_server_name = true,
			extend_gitsigns = false,
||||||| parent of 41c2f00 (Merge branch 'main')
=======
			show_server_name = true,
			extend_gitsigns = false,
>>>>>>> 41c2f00 (Merge branch 'main')
			keys = {
				quit = "q",
				exec = "<CR>",
			},
		},
<<<<<<< HEAD
		-- Diagnostics: https://nvimdev.github.io/lspsaga/diagnostic/
||||||| parent of 41c2f00 (Merge branch 'main')
		lightbulb = {
			enable = false,
			sign = true,
			enable_in_insert = true,
			sign_priority = 20,
			virtual_text = false,
		},
=======
		lightbulb = {
			enable = false,
			sign = true,
			sign_priority = 20,
			virtual_text = false,
		},
>>>>>>> 41c2f00 (Merge branch 'main')
		diagnostic = {
<<<<<<< HEAD
||||||| parent of 41c2f00 (Merge branch 'main')
			text_hl_follow = true,
			on_insert = true,
			on_insert_follow = false,
=======
			max_width = 0.5,
			max_height = 0.6,
			text_hl_follow = true,
>>>>>>> 41c2f00 (Merge branch 'main')
			show_code_action = true,
<<<<<<< HEAD
||||||| parent of 41c2f00 (Merge branch 'main')
			show_source = true,
			border_follow = true,
			extend_relatedInformation = false,
=======
			border_follow = true,
			diagnostic_only_current = false,
			extend_relatedInformation = false,
>>>>>>> 41c2f00 (Merge branch 'main')
			jump_num_shortcut = true,
<<<<<<< HEAD
			max_width = 0.5,
			max_height = 0.6,
			text_hl_follow = true,
			border_follow = true,
			extend_relatedInformation = true,
			show_layout = "float",
			show_normal_height = 10,
			max_show_width = 0.9,
			max_show_height = 0.6,
			diagnostic_only_current = false,
||||||| parent of 41c2f00 (Merge branch 'main')
=======
			show_layout = "float",
>>>>>>> 41c2f00 (Merge branch 'main')
			keys = {
				exec_action = "r",
				quit = "q",
				toggle_or_jump = "<CR>",
				quit_in_show = { "q", "<Esc>" },
			},
		},
<<<<<<< HEAD
		-- Hover: https://nvimdev.github.io/lspsaga/hover/
||||||| parent of 41c2f00 (Merge branch 'main')
		rename = {
			quit = "<C-c>",
			mark = "x",
			confirm = "<CR>",
			exec = "<CR>",
			in_select = true,
		},
=======
		rename = {
			in_select = false,
			auto_save = false,
			keys = {
				quit = "<C-c>",
				select = "x",
				exec = "<CR>",
			},
		},
>>>>>>> 41c2f00 (Merge branch 'main')
		hover = {
<<<<<<< HEAD
			max_width = 0.45,
			max_height = 0.7,
||||||| parent of 41c2f00 (Merge branch 'main')
=======
			max_width = 0.3,
			max_height = 0.7,
>>>>>>> 41c2f00 (Merge branch 'main')
			open_link = "gl",
			open_cmd = "silent !" .. require("core.settings").external_browser,
		},
<<<<<<< HEAD
		-- Impl: https://nvimdev.github.io/lspsaga/implement/
		implement = {
			enable = true,
			sign = true,
			virtual_text = false,
			priority = 100,
		},
		-- LightBulb: https://nvimdev.github.io/lspsaga/lightbulb/
		lightbulb = {
			enable = false,
			sign = true,
			virtual_text = false,
			debounce = 10,
			sign_priority = 20,
		},
		-- Rename: https://nvimdev.github.io/lspsaga/rename/
		rename = {
			in_select = false,
			auto_save = false,
			project_max_width = 0.5,
			project_max_height = 0.5,
||||||| parent of 41c2f00 (Merge branch 'main')
		outline = {
			win_position = "right",
			win_with = "_sagaoutline",
			win_width = 30,
			auto_preview = false,
			auto_refresh = true,
			auto_close = true,
			close_after_jump = true,
=======
		outline = {
			win_position = "right",
			win_width = 30,
			auto_preview = false,
			auto_close = true,
			close_after_jump = true,
			detail = false,
			layout = "normal",
>>>>>>> 41c2f00 (Merge branch 'main')
			keys = {
<<<<<<< HEAD
				quit = "<C-c>",
				exec = "<CR>",
				select = "x",
||||||| parent of 41c2f00 (Merge branch 'main')
				expand_or_jump = "<CR>",
				quit = "q",
=======
				toggle_or_jump = "<CR>",
				jump = "o",
				quit = "q",
>>>>>>> 41c2f00 (Merge branch 'main')
			},
		},
<<<<<<< HEAD
		-- Beacon: https://nvimdev.github.io/lspsaga/misc/#beacon
||||||| parent of 41c2f00 (Merge branch 'main')
		symbol_in_winbar = {
			enable = false,
			separator = " " .. icons.ui.Separator,
			hide_keyword = true,
			show_file = false,
			color_mode = true,
		},
=======
		symbol_in_winbar = {
			enable = true,
			separator = " " .. icons.ui.Separator,
			hide_keyword = false,
			show_file = false,
			color_mode = true,
		},
		implement = {
			enable = true,
			sign = true,
			virtual_text = false,
		},
		callhierarchy = {
			layout = "float",
			keys = {
				edit = "e",
				vsplit = "v",
				split = "s",
				tabe = "t",
				quit = "q",
				shuttle = "[]",
				toggle_or_req = "u",
				close = "<Esc>",
			},
		},
>>>>>>> 41c2f00 (Merge branch 'main')
		beacon = {
			enable = true,
			frequency = 12,
		},
		-- Generic UI Options: https://nvimdev.github.io/lspsaga/misc/#generic-ui-options
		ui = {
			title = false,
			devicon = true,
			border = "single", -- Can be single, double, rounded, solid, shadow.
<<<<<<< HEAD
			devicon = true,
			title = true,
||||||| parent of 41c2f00 (Merge branch 'main')
			winblend = 0,
			actionfix = icons.ui.Spell,
=======
			actionfix = icons.ui.Spell,
>>>>>>> 41c2f00 (Merge branch 'main')
			expand = icons.ui.ArrowClosed,
			collapse = icons.ui.ArrowOpen,
			code_action = icons.ui.CodeAction,
<<<<<<< HEAD
			actionfix = icons.ui.Spell,
			lines = { "┗", "┣", "┃", "━", "┏" },
			imp_sign = icons.kind.Implementation,
||||||| parent of 41c2f00 (Merge branch 'main')
			incoming = icons.ui.Incoming,
			outgoing = icons.ui.Outgoing,
=======
			imp_sign = icons.kind.Implementation,
>>>>>>> 41c2f00 (Merge branch 'main')
			kind = {
				-- Kind
				Class = { icons.kind.Class, "LspKindClass" },
				Constant = { icons.kind.Constant, "LspKindConstant" },
				Constructor = { icons.kind.Constructor, "LspKindConstructor" },
				Enum = { icons.kind.Enum, "LspKindEnum" },
				EnumMember = { icons.kind.EnumMember, "LspKindEnumMember" },
				Event = { icons.kind.Event, "LspKindEvent" },
				Field = { icons.kind.Field, "LspKindField" },
				File = { icons.kind.File, "LspKindFile" },
				Function = { icons.kind.Function, "LspKindFunction" },
				Interface = { icons.kind.Interface, "LspKindInterface" },
				Key = { icons.kind.Keyword, "LspKindKey" },
				Method = { icons.kind.Method, "LspKindMethod" },
				Module = { icons.kind.Module, "LspKindModule" },
				Namespace = { icons.kind.Namespace, "LspKindNamespace" },
				Operator = { icons.kind.Operator, "LspKindOperator" },
				Package = { icons.kind.Package, "LspKindPackage" },
				Property = { icons.kind.Property, "LspKindProperty" },
				Struct = { icons.kind.Struct, "LspKindStruct" },
				TypeParameter = { icons.kind.TypeParameter, "LspKindTypeParameter" },
				Variable = { icons.kind.Variable, "LspKindVariable" },
				-- Type
				Array = { icons.type.Array, "LspKindArray" },
				Boolean = { icons.type.Boolean, "LspKindBoolean" },
				Null = { icons.type.Null, "LspKindNull" },
				Number = { icons.type.Number, "LspKindNumber" },
				Object = { icons.type.Object, "LspKindObject" },
				String = { icons.type.String, "LspKindString" },
				-- ccls-specific icons.
				TypeAlias = { icons.kind.TypeAlias, "LspKindTypeAlias" },
				Parameter = { icons.kind.Parameter, "LspKindParameter" },
				StaticMethod = { icons.kind.StaticMethod, "LspKindStaticMethod" },
				-- Microsoft-specific icons.
				Text = { icons.kind.Text, "LspKindText" },
				Snippet = { icons.kind.Snippet, "LspKindSnippet" },
				Folder = { icons.kind.Folder, "LspKindFolder" },
				Unit = { icons.kind.Unit, "LspKindUnit" },
				Value = { icons.kind.Value, "LspKindValue" },
			},
		},
		-- Scrolling Keymaps: https://nvimdev.github.io/lspsaga/misc/#scrolling-keymaps
		scroll_preview = {
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
		request_timeout = 3000,
	})
end
