return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "vim", "vimdoc",
                "query",
                "bash",
                "c",
                "python",
                "java",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "ruby",
                "html",
                "css",
                "javascript"
            },

            sync_install = false,

            highlight = { enable = true },

            indent = { enable = true }
        })
    end
}

