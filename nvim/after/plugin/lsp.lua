local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
    'marksman',
    'lua_ls',
    'gopls',
    'tflint',
    'terraformls',
    'pyright',
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').terraformls.setup({})
require('lspconfig').tflint.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').pyright.setup({
    python = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
        }
    }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require("cmp")

cmp.setup({
    mapping = {
        -- `Enter` key to comfirm completiong
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
})
