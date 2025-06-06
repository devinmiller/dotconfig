return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		keys = {
			{ "\\", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
		},
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
				},
			},
		},
	},
}
