return {
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      require("onedark").setup({
        -- main options
        style = "warmer",

        -- custom colors
        colors = {},
        -- custom highlights
        highlights = {}
      })

      require("onedark").load()
    end,
  },
}