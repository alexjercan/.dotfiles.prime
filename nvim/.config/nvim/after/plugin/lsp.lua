local Remap = require("theprimeagen.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
        { name = "path" },
	},
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local function on_attach()
    nnoremap("<leader>vd", function() vim.lsp.buf.definition() end)
    nnoremap("<leader>vh", function() vim.lsp.buf.hover() end)
    nnoremap("<leader>vw", function() vim.lsp.buf.workspace_symbol() end)
    nnoremap("<leader>ve", function() vim.diagnostic.open_float() end)
    nnoremap("<leader>vn", function() vim.diagnostic.goto_next() end)
    nnoremap("<leader>vp", function() vim.diagnostic.goto_prev() end)
    nnoremap("<leader>va", function() vim.lsp.buf.code_action() end)
    nnoremap("<leader>vr", function() vim.lsp.buf.references() end)
    nnoremap("<leader>vm", function() vim.lsp.buf.rename() end)
    nnoremap("<leader>vs", function() vim.lsp.buf.signature_help() end)
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
	root_dir = function() return vim.loop.cwd() end
})

require('lspconfig').tsserver.setup({
    on_attach=on_attach,
    flags = lsp_flags,
	root_dir = function() return vim.loop.cwd() end
})

require('lspconfig').clangd.setup({
	cmd = {
			"clangd-12",
			"--background-index",
			"--suggest-missing-includes",
	},
    on_attach=on_attach,
    flags = lsp_flags,
	root_dir = function() return vim.loop.cwd() end
})

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})

