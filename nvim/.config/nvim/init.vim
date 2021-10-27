set path+=**

set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set isfname+=@-@
set cmdheight=2
set updatetime=50
set completeopt=menu,menuone,noselect,preview
set shortmess+=c
set colorcolumn=80

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/harpoon'

call plug#end()

lua require("theprimeagen")
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
set background=dark
call luaeval('vim.cmd("colorscheme " .. _A[1])', ["gruvbox"])
highlight ColorColumn ctermbg=0 guibg=grey
hi SignColumn guibg=none
hi CursorLineNR guibg=None
highlight Normal guibg=none
highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f
hi TelescopeBorder guifg=#5eacd

let g:vim_be_good_log_file = 1
let g:rg_derive_root='true'

let mapleader = " "

nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vs :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>va :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vc :lua vim.lsp.codelens.run()<CR>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
nnoremap <C-m> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-l> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-t> :lua require("harpoon.term").gotoTerminal(1)<CR>i
tnoremap <Esc> <C-\><C-n>
tnoremap <C-t> <C-\><C-n><C-o>

nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= :resize 100<CR>

nnoremap <C-f> /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

xnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

inoremap <C-c> <esc>

inoremap <Up>     <C-o>:echom "--> k <-- "<CR>
inoremap <Down>   <C-o>:echom "--> j <-- "<CR>
inoremap <Right>  <C-o>:echom "--> l <-- "<CR>
inoremap <Left>   <C-o>:echom "--> h <-- "<CR>

nnoremap <silent> Q <nop>
nnoremap <leader>wh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
