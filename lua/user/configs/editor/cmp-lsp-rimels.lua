return function()
	vim.system({ "rime-ls", "--listen", "127.0.0.1:9257" }, { detach = true })
	require("rimels").setup({
		cmd = vim.lsp.rpc.connect("127.0.0.1", 9257),
	})
end
