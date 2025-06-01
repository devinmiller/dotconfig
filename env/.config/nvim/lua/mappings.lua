-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>mf", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open [M]ini[F]iles" })
vim.keymap.set("n", "<leader>tw", "<cmd>lua Translate.open()<CR>")
vim.keymap.set("n", "<leader>tc", "<cmd>lua Translate.close()<CR>")

-- Keybinds for managing tabs
vim.keymap.set("n", "<C-t>", "<cmd>tab split<CR>", { desc = "Move window to new [t]ab" })
vim.keymap.set("n", "<C-[>", "<cmd>tabp<CR>", { desc = "Move to the [p]revious tab" })
vim.keymap.set("n", "<C-]>", "<cmd>tabn<CR>", { desc = "Move to the [n]ext tab " })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
