return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	-- Please set additional flags for the supported servers here
	-- Don't specify any config here if you are using the default one.
	local sources = {
		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			extra_args = require("completion.formatters.clang_format"),
		}),
		btns.formatting.prettier.with({
			filetypes = {
				"vue",
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"yaml",
				"html",
				"css",
				"scss",
				"sh",
				"markdown",
			},
		}),
	}
	null_ls.setup({
		border = "rounded",
		debug = false,
		log_level = "warn",
		update_in_insert = false,
		sources = sources,
	})

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})

	-- NOTE: Users don't need to specify null-ls sources if using only default config.
	-- "mason-null-ls" will auto-setup for users.
	-- mason_null_ls.setup_handlers({
	-- 	black = function()
	-- 		null_reg(btnf.black.with({ extra_args = { "--fast" } }))
	-- 	end,
	-- 	markdownlint = function()
	-- 		null_reg(btnf.markdownlint)
	-- 		null_reg(btnd.markdownlint.with({ extra_args = { "--disable MD033" } }))
	-- 	end,
	-- 	-- example for changing diagnostics_format
	-- 	-- shellcheck = function()
	-- 	-- 	null_reg(btnd.shellcheck.with({ diagnostics_format = "#{m} [#{s} #{c}]" }))
	-- 	-- end,
	-- })

	require("completion.formatting").configure_format_on_save()
end
