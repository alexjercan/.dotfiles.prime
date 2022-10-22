vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Simple plugins can be specified as strings
    use("TimUntersberger/neogit")
    use("kylechui/nvim-surround")
    use("mbbill/undotree")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    -- All the things
    use("neovim/nvim-lspconfig")

    -- cmp
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")

    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-path")
    use("uga-rosa/cmp-dictionary")

    -- snip
    use("L3MON4D3/LuaSnip")
    use("honza/vim-snippets")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use({"catppuccin/nvim", as = "catppuccin" })
    use({"rose-pine/neovim", as = "rose-pine" })

    -- Treeshitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
end)
