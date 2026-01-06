return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00FF00", bg = "NONE" }) -- Green for added lines
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#FFFF00", bg = "NONE" }) -- Yellow for changed lines
        require("gitsigns").setup({
            current_line_blame = true,
            -- blame_format = '<author> • <date> • <summary>',
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' }
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' }
            },
            signs_staged_enable = true,
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        })
    end
}

