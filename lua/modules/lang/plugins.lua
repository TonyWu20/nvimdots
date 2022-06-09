local lang = {}
local conf = require("modules.lang.config")

lang["iamcco/markdown-preview.nvim"] = {
	opt = true,
	ft = "markdown",
	run = "cd app && yarn install",
}
lang["chrisbra/csv.vim"] = { opt = true, ft = "csv" }
lang["tami5/swift.nvim"] = { opt = true, ft = "swift", config = conf.swift}
return lang
