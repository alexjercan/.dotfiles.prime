local cmp = require'cmp'
local lsp_status = require('lsp-status')

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },

    sources = {
        { name = 'nvim_lsp' },

        -- For vsnip user.
        -- { name = 'vsnip' },

        -- For luasnip user.
        -- { name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = 'buffer' },
    }
})


local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

require'lspconfig'.hls.setup {
    config();
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.tsserver.setup{
    config();
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.clangd.setup {
    config();
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.jedi_language_server.setup{}

require'lspconfig'.yamlls.setup{}

