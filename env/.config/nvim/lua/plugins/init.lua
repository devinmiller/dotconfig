return {
  { "gruvbox-community/gruvbox" },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      require("onedark").setup({
        -- main options
        style = "warmer",

        -- custom highlights
        highlights = {
          -- ["FloatBorder"] = { bg = "#232326" }
        }
      })

      require("onedark").load()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --   require("catppuccin").setup({})
    --   pcall(vim.cmd, "colorscheme catppuccin")
    -- end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  },
}
