return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    enabled = false,

    opts = {
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "ollama",
                    formatted_name = "Ollama",
                    schema = {
                        model = {
                            default = "qwen2.5-coder",
                        }
                    }
                })
            end,

        },

        strategies = {
            chat = {
                adapter = "ollama",
            },
            inline = {
                adapter = "ollama",
            },
            explain = {
                adapter = "ollama",
            },
        },
    }
}
