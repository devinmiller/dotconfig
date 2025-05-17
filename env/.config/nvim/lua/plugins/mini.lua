return {
	"echasnovski/mini.nvim",
	config = function()
		-- Navigate and manipulate file system
		require("mini.files").setup({})
		-- Simple and easy statusline, set use_icons to true if you have a Nerd Font
		require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })
		-- Minimal and fast autopairs
		require("mini.pairs").setup({})
		-- Fast and feature-rich surround actions
		require("mini.surround").setup({})
	end,
}
