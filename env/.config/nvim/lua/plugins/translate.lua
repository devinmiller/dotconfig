return {
	{
		"devinmiller/translate.nvim",
		config = function()
			require("translate").setup({
				dict_path = "~/kaikki.org-dictionary-Italian.jsonl",
			})
		end,
	},
}
