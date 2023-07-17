return function()
	vim.g.vimtex_view_method = "zathura"
	vim.g.vimtex_compiler_latexmk_engines = {
		_ = "-xelatex",
	}
	vim.g.tex_comment_nospell = 1
	vim.g.vimtex_compiler_progname = "nvr"
end
