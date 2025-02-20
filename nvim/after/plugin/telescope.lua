local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        -- Start Telescope in normal mode, press `i` to insert
        initial_mode = "normal",
        -- Configure mappings
        mappings = {
            n = {
                -- Normal mode mappings
            },
            i = {
                -- Insert mode mapping
            }
        }
    },
    extensions = {
        file_browser = {
            -- Disable netrw and use telescope-file-browser instead
            hijack_netrw = true,
        }
    }
})

telescope.load_extension("file_browser")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Keybindings for Telescope file pickers
keymap.set("n", "<leader>ff", builtin.find_files, opts)
keymap.set("n", "<leader>fg", builtin.live_grep, opts)
keymap.set("n", "<leader>fb", builtin.buffers, opts)
-- Keybinding for Telescope to resume picker
keymap.set("n", "<leader>fr", ":Telescope resume<CR>", opts)

-- Keybindings for Telescope Git pickers
keymap.set("n", "<leader>fs", builtin.git_status, opts)

-- Keybindings for Telescope file browser
keymap.set("n", "<leader>fd", ":Telescope file_browser<CR>", opts)
