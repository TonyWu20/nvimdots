return function()
	vim.system({ "rime_ls", "--listen", "127.0.0.1:9257" }, { detach = true })
	require("rimels").setup({

		keys = { start = "<C-X>f", stop = "<C-X>;", esc = "<C-X>j", undo = "<C-X>u" },
		cmd = vim.lsp.rpc.connect("127.0.0.1", 9257),
		cmp_keymaps = {
			disable = {
				punctuation_upload_directly = true,
			},
		},
		rime_user_dir = "~/.local/share/rime-ls",
		shared_data_dir = "~/.local/share/rime-data",
	})
end
