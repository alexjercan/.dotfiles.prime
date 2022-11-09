function ColorMyPencils(colorscheme)
    require("transparent").setup({
      enable = true, -- boolean: enable transparent
      extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups

        -- example of akinsho/nvim-bufferline.lua
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
      },
      exclude = {}, -- table: groups you don't want to clear
    })

    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.tokyonight_transparent_sidebar = vim.g.transparent_enabled
    vim.g.tokyonight_transparent = vim.g.transparent_enabled
    vim.g.gruvbox_invert_selection = '0'
    vim.opt.background = "dark"

    vim.cmd("colorscheme " .. colorscheme)

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

    hl("ColorColumn", {
        ctermbg = 0,
        bg = "#555555",
    })

    hl("CursorLineNR", {
        bg = "None"
    })

    hl("LineNr", {
        fg = "#5eacd3"
    })

    hl("netrwDir", {
        fg = "#5eacd3"
    })
end

ColorMyPencils("tokyonight")

