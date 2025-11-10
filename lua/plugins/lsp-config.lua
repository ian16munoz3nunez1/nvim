return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd", "gopls", "jdtls", "pylsp", "solargraph"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config["lua_ls"] = {
                cmd = { "lua-language-server" },
                filetypes = { "lua" }
            }
            vim.lsp.enable("lua_ls")

            vim.lsp.config["clangd"] = {
                cmd = { "clangd" },
                filetypes = { "c", "cpp", "h" }
            }
            vim.lsp.enable("clangd")

            vim.lsp.config["gopls"] = {
                cmd = { "gopls" },
                filetypes = { "go" }
            }
            vim.lsp.enable("gopls")

            vim.lsp.config["jdtls"] = {
                cmd = { "jdtls" },
                filetypes = { "java" }
            }
            vim.lsp.enable("jdtls")

            vim.lsp.enable("pylsp")

            vim.lsp.config["solargraph"] = {
                cmd = { "solargraph" },
                filetypes = { "rb" }
            }
            vim.lsp.enable("solargraph")

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {})
        end
    }
}

