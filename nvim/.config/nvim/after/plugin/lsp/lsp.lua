local Remap = require("theprimeagen.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local on_attach = function()
    nnoremap("<leader>vd", vim.lsp.buf.definition)
    nnoremap("<leader>vh", vim.lsp.buf.hover)
    nnoremap("<leader>vw", vim.lsp.buf.workspace_symbol)
    nnoremap("<leader>ve", vim.diagnostic.open_float)
    nnoremap("<leader>vn", vim.diagnostic.goto_next)
    nnoremap("<leader>vp", vim.diagnostic.goto_prev)
    nnoremap("<leader>va", vim.lsp.buf.code_action)
    nnoremap("<leader>vr", vim.lsp.buf.references)
    nnoremap("<leader>vm", vim.lsp.buf.rename)
    nnoremap("<leader>vs", vim.lsp.buf.signature_help)
    nnoremap("<leader>vc", function()
        vim.lsp.codelens.refresh()
        vim.lsp.codelens.run()
    end)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

require('lspconfig').jedi_language_server.setup({
    on_attach=on_attach,
    flags = lsp_flags,
})

require('lspconfig').hls.setup({
    on_attach=on_attach,
    flags = lsp_flags,
	root_dir = vim.loop.cwd,
})

require('lspconfig').tsserver.setup({
    on_attach=on_attach,
    flags = lsp_flags,
	root_dir = vim.loop.cwd,
})

require('lspconfig').clangd.setup({
	cmd = {
			"clangd-12",
			"--background-index",
			"--suggest-missing-includes",
	},
    on_attach=on_attach,
    flags = lsp_flags,
	root_dir = vim.loop.cwd,
})

require('lspconfig').rust_analyzer.setup({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    on_attach = on_attach,
    flags = lsp_flags,
})
