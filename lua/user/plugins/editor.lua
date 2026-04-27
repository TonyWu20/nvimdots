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

editor["kkew3/jieba.vim"] = {
	tag = "v2.1.0",
	build = ":call jieba_vim#install()",
	init = function()
		vim.g.jieba_vim_lazy = 1
		vim.g.jieba_vim_keymap = 1
	end,
}

editor["coder/claudecode.nvim"] = {
	dependencies = { "folke/snacks.nvim" },
	config = true,
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}

editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = false,
	branch = "main",
	build = function()
		if #vim.api.nvim_list_uis() > 0 then
			vim.api.nvim_command([[TSUpdate]])
		end
	end,
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				-- Enable treesitter highlighting and disable regex syntax
				pcall(vim.treesitter.start)
				-- Enable treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		local ensureInstalled = {
			"lua",
			"python",
			"rust",
			"latex",
			"markdown",
			"fortran",
			-- ... your parsers
		}
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
		-- ...
	end,
	dependencies = {
		{ "mfussenegger/nvim-treehopper" },
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
			config = require("editor.ts-textobjects"),
		},
		{
			"andymass/vim-matchup",
			init = require("editor.matchup"),
		},
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		{
			"hiphish/rainbow-delimiters.nvim",
			submodules = false,
			config = require("editor.rainbow_delims"),
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = require("editor.ts-context-commentstring"),
		},
	},
}

return editor
