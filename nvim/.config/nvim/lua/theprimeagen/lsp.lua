local cmp = require('cmp')
local nvim_ts= require('nvim-treesitter.configs')

nvim_ts.setup({
    indent = { enable = true },
    highlight = {
        enable = true,
        -- disable = { 'haskell' }
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true }
})

cmp.setup({
    snippet = {
        expand = function(args)
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
        { name = 'buffer' },
    }
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

require('lspconfig').hls.setup({
    config(),
    root_dir = function() return vim.loop.cwd() end
})

require('lspconfig').tsserver.setup({
    config(),
    root_dir = function() return vim.loop.cwd() end
})

require('lspconfig').clangd.setup({
    cmd = {
        "clangd-12",
        "--background-index",
        "--suggest-missing-includes",
    },
    config(),
    root_dir = function() return vim.loop.cwd() end
})

require('lspconfig').jedi_language_server.setup({
    config(),
})

