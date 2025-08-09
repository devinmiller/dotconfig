vim.opt.wrap = false

vim.keymap.set(
	"n",
	"<leader>sw",
	[[:sort /^"\(il \|i \|gli \|l'\|la \|le \|in \|a \|di \|al \|alla \|d'\|da \|lo \|un \|una \|un'\)*/]]
)
