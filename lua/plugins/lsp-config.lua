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
                ensure_installed = {"lua_ls", "arduino_language_server", "clangd", "gopls", "jdtls", "pylsp", "solargraph"}
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

            vim.lsp.config["arduino_language_server"] = {
                cmd = { "arduino_language_server" },
                filetypes = { "ino" }
            }
            vim.lsp.enable("arduino_language_server")

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
                cmd = { "solargraph", "stdio" },
                filetypes = { "ruby" }
            }
            vim.lsp.enable("solargraph")

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '🚨',
                        [vim.diagnostic.severity.WARN] = '⚠️',
                        [vim.diagnostic.severity.INFO] = 'ℹ️',
                        [vim.diagnostic.severity.HINT] = '💡'
                    },
                    -- linehl = {
                    --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                    --     [vim.diagnostic.severity.WARN] = 'WarningMsg'
                    -- },
                    numhl = {
                        [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                        [vim.diagnostic.severity.WARN] = 'WarningMsg'
                    }
                }
            })

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {})

            vim.keymap.set('n', ']e', function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
            end, { desc = 'Go to next error' })
            vim.keymap.set('n', '[e', function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end, { desc = 'Go to previous error' })

            vim.keymap.set('n', ']w', function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
            end, { desc = 'Go to next warning' })
            vim.keymap.set('n', '[w', function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
            end, { desc = 'Go to previous warning' })

            vim.keymap.set('n', ']i', function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO })
            end, { desc = 'Go to next info' })
            vim.keymap.set('n', '[i', function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO })
            end, { desc = 'Go to previous info' })

            vim.keymap.set('n', ']h', function()
                vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT })
            end, { desc = 'Go to next hint' })
            vim.keymap.set('n', '[h', function()
                vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT })
            end, { desc = 'Go to previous hint' })
        end
    }
}

