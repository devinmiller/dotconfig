return {
	{
		"devinmiller/translate.nvim",
		config = function()
			require("translate").setup({
				dict_path = "~/raw-wiktextract-data.jsonl",
				lang_code = "it",
			})
		end,
	},
}
