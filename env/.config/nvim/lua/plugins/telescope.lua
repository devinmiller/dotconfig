return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					mappings = {},
					-- initial_mode = "normal",
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					fzf = {},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [Help]" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set("n", "<leader>fi", builtin.highlights, { desc = "[F]ind h[I]ghlights" })
			vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfixes" })
			vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[F]ind [M]arks" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end)

			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			-- A very hack method to track how frequently I'm searching for definitions
			-- in the various CSV files I have for learning Italian
			vim.keymap.set("n", "<leader>fw", function()
				builtin.live_grep(require("telescope.themes").get_dropdown({
					previewer = false,
					attach_mappings = function(prompt_bufnr, map)
						map("i", "<CR>", function()
							local selection = action_state.get_selected_entry()
							-- Assume there is never a comma or escaped quotes in the first CSV entry
							local word = selection.text:match('^"([^"]*)"') or selection.text:match("^([^,]*)")
							-- Assume this project is in source control
							local file_name = vim.fs.joinpath(vim.fs.root(0, ".git"), "lookups.csv")

							local lookups = {}
							-- Load the existing entries if any exist
							if vim.fn.filereadable(file_name) == 1 then
								local lines = vim.fn.readfile(file_name)
								for _, line in ipairs(lines) do
									local entry = vim.split(line, ",")
									local key = entry[1]:gsub('"', "")
									local value = entry[2]:gsub('"', "")

									lookups[key] = value
								end
							end

							lookups[word] = (lookups[word] or 0) + 1

							local entries = {}
							for key, value in pairs(lookups) do
								table.insert(entries, string.format('"%s","%s"', key, tostring(value)))
							end
							table.sort(entries)

							vim.fn.writefile(entries, file_name)

							actions.select_default(prompt_bufnr)
						end)

						return true
					end,
					glob_pattern = { "*.csv" },
				}))
			end)
		end,
	},
}
