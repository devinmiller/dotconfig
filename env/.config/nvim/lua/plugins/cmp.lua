return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
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
          { name = "nvim_lsp_signature_help" },
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        -- When running inside a Docker container the keybinding for detaching a
        -- a container must be changed in order for any mappings using ctrl + p
        -- to pass through to Neovim.
        -- Refer to https://docs.docker.com/reference/cli/docker/container/attach/
        mapping = cmp.mapping.preset.insert({
          -- Select the [n]ext item
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Select the [p]revious item
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Scroll [b]ack in the documentation
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- Scroll [f]orward in the documentation
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Show completion suggestion
          ["<C-Space>"] = cmp.mapping.complete(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- -- Safely select entries with <CR>
          -- ["<CR>"] = cmp.mapping({
          --   i = function (fallback)
          --     if cmp.visible() and cmp.get_active_entry() then
          --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          --     else
          --       fallback()
          --     end
          --   end,
          --   s = cmp.mapping.confirm({ select = true }),
          --   c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          -- })
          -- -- Accept ([y]es) the completion.
          -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },
}
