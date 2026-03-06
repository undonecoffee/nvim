return {
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/codecompanion-history.nvim",
        },
        config = function()
            require("codecompanion").setup({
                adapters = {
                    http = {
                        anthropic = function()
                            return require("codecompanion.adapters").extend("anthropic", {
                                env = {
                                    api_key = "ANTHROPIC_API_KEY",
                                },
                            })
                        end,
                    },
                },
                strategies = {
                    chat = { adapter = "anthropic" },
                    inline = { adapter = "anthropic" },
                    agent = { adapter = "anthropic" },
                },
                extensions = {
                    history = {
                        enabled = true,
                        opts = {
                            auto_save = true,
                            -- Keymap to open history from chat buffer (default: gh)
                            keymap = "gh",
                            -- auto_generate_title = true,
                            -- title_generation_opts = {
                            --     adapter = "anthropic",
                            --     refresh_every_n_prompts = 0,
                            --     max_refreshes = 3,
                            --     format_title = function(original_title)
                            --         return original_title
                            --     end,
                            --     continue_last_chat = false,
                            -- },
                            dir_to_save = vim.fn.expand("~") .. "/passwords/documentation/AI-chats/codecompanion",
                        },
                    },
                },
            })
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
            preview = {
                filetypes = { "markdown", "codecompanion" },
                ignore_buftypes = {},
            },
        },
    },
}
