local Remap = require("theprimeagen.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Telescope
nnoremap("<C-p>", ":Telescope<CR>")

nnoremap("<leader>ps", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) end)

nnoremap("<leader>pg", function() require('telescope.builtin').git_files() end)
nnoremap("<Leader>pf", function() require('telescope.builtin').find_files() end)

nnoremap("<leader>pw", function() require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") } end)
nnoremap("<leader>pb", function() require('telescope.builtin').buffers() end)
nnoremap("<leader>ph", function() require('telescope.builtin').help_tags() end)

nnoremap("<leader>vrc", function() require('theprimeagen.telescope').search_dotfiles({ hidden = true }) end)

-- nerd tree
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- cool move line in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- don't ask
nnoremap("Y", "yg$")

-- better moves
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

-- real alphas always delete in main register, I am not an alpha
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- what?
nnoremap("Q", "<nop>")

nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")

-- for fast repalce
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- do this on the bash script you download from the internet
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- for when you have to share the screen and they ask you
-- "what does the code from the line 10 mean?"
nnoremap("<leader>rnu", ":set rnu!<CR>")

-- don't be a pussy, just use hjkl
inoremap("<Up>", "<C-o>:echom \"--> k <-- \"<CR>")
inoremap("<Down>", "<C-o>:echom \"--> j <-- \"<CR>")
inoremap("<Right>", "<C-o>:echom \"--> l <-- \"<CR>")
inoremap("<Left>", "<C-o>:echom \"--> h <-- \"<CR>")
nnoremap("<Up>", ":echom \"--> k <-- \"<CR>")
nnoremap("<Down>", ":echom \"--> j <-- \"<CR>")
nnoremap("<Right>", ":echom \"--> l <-- \"<CR>")
nnoremap("<Left>", ":echom \"--> h <-- \"<CR>")

