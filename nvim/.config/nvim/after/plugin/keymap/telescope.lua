local Remap = require("theprimeagen.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope<CR>")

nnoremap("<leader>ps", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) end)

nnoremap("<leader>pg", function() require('telescope.builtin').git_files() end)
nnoremap("<Leader>pf", function() require('telescope.builtin').find_files() end)

nnoremap("<leader>pw", function() require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") } end)
nnoremap("<leader>pb", function() require('telescope.builtin').buffers() end)
nnoremap("<leader>ph", function() require('telescope.builtin').help_tags() end)

nnoremap("<leader>vrc", function() require('theprimeagen.telescope').search_dotfiles({ hidden = true }) end)

