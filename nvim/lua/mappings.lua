-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Not entirely convinced I need, or like, having keybindings for creating windows
-- -- Keybinds to make managing windows easier.
-- --  Use <ALT>+hjkl to create a new window
-- vim.keymap.set("n", "<M-h>", "<cmd>:vert lefta new<CR>", { desc = "Create a new window to the left" })
-- vim.keymap.set("n", "<M-j>", "<cmd>:hor rightb new<CR>", { desc = "Create a new window below" })
-- vim.keymap.set("n", "<M-k>", "<cmd>:hor lefta new<CR>", { desc = "Create a new window above" })
-- vim.keymap.set("n", "<M-l>", "<cmd>:vert rightb new<CR>", { desc = "Create a new window to the right" })
--
-- -- Keybinds to make managing windows easier.
-- --  Use <ALT>+HJKL to create a new full-sized window
-- vim.keymap.set("n", "<M-H>", "<cmd>:vert to new<CR>", { desc = "Create a new full height window to the left" })
-- vim.keymap.set("n", "<M-J>", "<cmd>:hor bo new<CR>", { desc = "Create a new full height window below" })
-- vim.keymap.set("n", "<M-K>", "<cmd>:hor to new<CR>", { desc = "Create a new full height window above" })
-- vim.keymap.set("n", "<M-L>", "<cmd>:vert bo new<CR>", { desc = "Create a new full height window to the right" })
