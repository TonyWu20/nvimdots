return function()
	-- use a custom port to start server or empty for random
	vim.g.mkdp_open_ip = "0.0.0.0"
	vim.g.mkdp_open_to_the_world = 1
	vim.g.mkdp_port = 8080
	vim.g.mkdp_echo_preview_url = 1
end
