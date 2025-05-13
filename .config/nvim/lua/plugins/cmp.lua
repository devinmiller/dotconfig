return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer",                 keyword_length = 3 },
          { name = "path" },
          { name = "nvim_lsp_signature_help" }
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- Select the [n]ext item
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Select the [p]revious item
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Scroll [b]ack in the documentation
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- Scroll [f]orward in the documentation
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Accept ([y]es) the completion.
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        })
      })
    end
  }
}
