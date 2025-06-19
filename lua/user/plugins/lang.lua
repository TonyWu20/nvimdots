local lang = {}
lang["tommason14/lammps.vim"] = {}
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
	ft = "markdown",
	build = ":call mkdp#util#install()",
	config = require("configs.lang.markdown-preview"),
}
return lang
