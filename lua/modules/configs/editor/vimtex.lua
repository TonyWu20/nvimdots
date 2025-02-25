return function()
	require("modules.utils").load_plugin("vimtex", {}, true)
	vim.g.vimtex_view_method = "zathura"
	vim.g.vimtex_callback_progname = "/usr/bin/nvim"
	vim.g.vimtex_compiler_latexmk_engines = {
		_ = "-xelatex",
	}
	vim.g.tex_comment_nospell = 1
	-- vim.g.vimtex_compiler_progname = "nvr"
	-- vim.g.vimtex_view_skim_sync = 1
end
