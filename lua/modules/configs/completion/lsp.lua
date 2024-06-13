return function()
	local nvim_lsp = require("lspconfig")
	require("completion.neoconf").setup()
	require("completion.mason").setup()
	require("completion.mason-lspconfig").setup()

	local opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	-- Setup lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
	local words = {}
	for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
		table.insert(words, word)
	end
	nvim_lsp.ltex.setup({
		settings = {
			ltex = {
				dictionary = {
					["en-US"] = words,
				},
			},
		},
	})
	if vim.fn.executable("dart") == 1 then
		local ok, _opts = pcall(require, "user.configs.lsp-servers.dartls")
		if not ok then
			_opts = require("completion.servers.dartls")
		end
		local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
		nvim_lsp.dartls.setup(final_opts)
	end

	pcall(require, "user.configs.lsp")

	pcall(vim.cmd.LspStart) -- Start LSPs
end
