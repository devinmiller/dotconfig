-- we know it works now
-- print("It works!")
require("mappings")
require("core.lazy")

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	desc = "Open new terminal with custom configuration",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
	group = vim.api.nvim_create_augroup("Color", {}),
	pattern = "*",
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		-- Fixing a few styling issues around floating windows and themes
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal.bg })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = normal.bg })
		vim.api.nvim_set_hl(0, "Pmenu", { bg = normal.bg })
		-- Fixing a few styling issues with Nvim Tree
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = normal.bg })
		vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = normal.bg })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { fg = normal.bg, bg = normal.bg })
	end,
})

require("options")
