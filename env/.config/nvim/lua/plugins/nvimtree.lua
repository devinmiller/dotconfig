return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local nvimtree = require("nvim-tree")

			-- recommended settings from nvim-tree documentation
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			nvimtree.setup({
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "\\", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
			keymap.set(
				"n",
				"<leader>nf",
				"<cmd>NvimTreeFindFileToggle<CR>",
				{ desc = "Toggle file explorer on current file" }
			) -- toggle file explorer on current file
			keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
			keymap.set("n", "<leader>nr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
		end,
	},
}
