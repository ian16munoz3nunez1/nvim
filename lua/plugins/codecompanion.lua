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
                            default = "gemma4:31b-cloud",
                        }
                    }
                })
            end,

        },

        strategies = {
            chat = {
                adapter = "ollama",
                roles = {
                    llm = "🤖 CodeCompanion",
                    user = "👨‍💻 me"
                }
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
