local function on_attach()
    -- TODO: TJ told me to do this and I should do it because he is Telescopic
    -- "Big Tech" "Cash Money" Johnson
end

require'lspconfig'.hls.setup {
    on_attach=on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.tsserver.setup{ on_attach=on_attach }

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

require'lspconfig'.jedi_language_server.setup{
    on_attach=on_attach,
}

require'lspconfig'.yamlls.setup{}

