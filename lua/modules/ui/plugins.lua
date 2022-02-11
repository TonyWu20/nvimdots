local ui = {}
local conf = require("modules.ui.config")

ui["kyazdani42/nvim-web-devicons"] = { opt = false }
ui["sainnhe/edge"] = { opt = false, config = conf.edge }
ui["rebelot/kanagawa.nvim"] = { opt = false, config = conf.kanagawa }
-- ui["catppuccin/nvim"] = {
-- 	opt = false,
-- 	as = "catppuccin",
-- 	config = conf.catppuccin,
-- }
ui["hoob3rt/lualine.nvim"] = {
	opt = true,
	after = "lualine-lsp-progress",
	config = conf.lualine,
}
ui["arkav/lualine-lsp-progress"] = { opt = true, after = "nvim-gps" }
ui["glepnir/dashboard-nvim"] = { opt = true, event = "BufWinEnter" }
ui["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	cmd = { "NvimTreeToggle", "NvimTreeOpen" },
	config = conf.nvim_tree,
}
ui["lewis6991/gitsigns.nvim"] = {
	opt = true,
	event = { "BufRead", "BufNewFile" },
	config = conf.gitsigns,
	requires = { "nvim-lua/plenary.nvim", opt = true },
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	opt = true,
	event = "BufRead",
	config = conf.indent_blankline,
}
-- ui["akinsho/nvim-bufferline.lua"] = {
-- 	opt = true,
-- 	event = "BufRead",
-- 	config = conf.nvim_bufferline,
-- }
ui["dstein64/nvim-scrollview"] = { opt = true, event = "BufRead" }
ui["folke/tokyonight.nvim"] = {opt = false, config = conf.tokyonight}
ui["eddyekofo94/gruvbox-flat.nvim"] = {opt = false, config = conf.gruvbox}
ui["kdheepak/tabline.nvim"]={
  config = function()
    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = true, -- shows base filename only instead of relative path in filename
        modified_icon = "+ ", -- change the default modified icon
        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
      }
    }
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  end,
  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
}

return ui
