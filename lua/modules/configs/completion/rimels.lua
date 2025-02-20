return function()
	vim.system({ "rime_ls", "--listen", "127.0.0.1:9257" }, { detach = true })
	require("rimels").setup({
		cmd = vim.lsp.rpc.connect("127.0.0.1", 9257),
		cmp_keymaps = {
			disable = {
				punctuation_upload_directly = true,
			},
		},
	})
end
