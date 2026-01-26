-- flash
-- auto-close
-- auto complete
-- LSP
-- formatting
-- treesitter
-- luasnip
return {
    { 'norcalli/nvim-colorizer.lua' },

    {
        'sylvanfranklin/omni-preview.nvim',
        opts = {},
        dependencies = {
            -- Typst
            { 'chomosuke/typst-preview.nvim', lazy = true },
            -- CSV
            { 'hat0uma/csvview.nvim', lazy = true },
            { 'toppair/peek.nvim', lazy = true, build = 'deno task --quiet build:fast' },
            { 'iamcco/markdown-preview.nvim', lazy = true },
        },
        config = function()
            require('omni-preview').setup()
            require('peek').setup { app = 'browser' }
        end,
    },
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {
            search = { mode = 'exact' },
            jump = { register = false, pos = 'end' },
            label = { uppercase = false },
            rainbow = { enabled = true },
            highlight = { backdrop = false, matches = false },
            modes = {
                char = { enabled = false },
            },
        },

        keys = {
            {
                's',
                mode = { 'n', 'v', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
        },
    },

    -- {
    --     'm4xshen/autoclose.nvim',
    --     config = function()
    --         require('autoclose').setup {
    --             keys = {
    --                 ['<'] = { escape = false, close = true, pair = '<>', disabled_filetypes = {} },
    --             },
    --             options = {
    --                 pair_spaces = true,
    --             },
    --         }
    --     end,
    -- },
    {
        'L3MON4D3/LuaSnip',
        opts = {
            enable_autosnippets = true,
        },
    },
    {

        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        -- See `:help nvim-treesitter`
        opts = {
            ensure_installed = { 'bash', 'javascript', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
    },
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            {
                '<leader>t',
                function()
                    require('conform').format { async = true, lsp_format = 'fallback' }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                return {
                    timeout_ms = 500,
                    lsp_format = 'fallback',
                }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'dprint' },
                sh = { 'shfmt' },
            },
        },
    },
    { -- Autocompletion
        'saghen/blink.cmp',
        event = 'VimEnter',
        version = '1.*',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'folke/lazydev.nvim',
        },
        opts = {
            keymap = {
                -- 'default' (recommended) for mappings similar to built-in completions
                --   <c-y> to accept ([y]es) the completion.
                --    This will auto-import if your LSP supports it.
                --    This will expand snippets if the LSP sent a snippet.
                -- 'super-tab' for tab to accept
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- For an understanding of why the 'default' preset is recommended,
                -- you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                --
                -- All presets have the following mappings:
                -- <tab>/<s-tab>: move to right/left of your snippet expansion
                -- <c-space>: Open menu or open docs if already open
                -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
                -- <c-e>: Hide menu
                -- <c-k>: Toggle signature help
                --
                -- See :h blink-cmp-config-keymap for defining your own keymap
                preset = 'enter',

                -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            },

            appearance = {
                nerd_font_variant = 'mono',
            },

            completion = {
                -- list = {
                --     selection = {
                --         preselect = false,
                --     },
                -- },

                -- By default, you may press `<c-space>` to show the documentation.
                -- Optionally, set `auto_show = true` to show the documentation after a delay.
                -- documentation = { auto_show = false, auto_show_delay_ms = 200 },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'lazydev' },
                providers = {
                    lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
                },
            },

            -- snippets = { preset = 'luasnip' },
            fuzzy = { implementation = 'lua' },
            signature = { enabled = true },
        },
    },
    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            'saghen/blink.cmp',
        },
        config = function()
            -- vim.api.nvim_create_autocmd('LspAttach', {
            --     group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            --     callback = function(event)
            --         local map = function(keys, func, desc, mode)
            --             mode = mode or 'n'
            --             vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            --         end
            --         map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
            --         map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
            --         map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            --         map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            --         map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            --         map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            --         map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
            --         map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
            --         map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
            --     end,
            -- })

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --
            --  Add any additional override configuration in the following tables. Available keys are:
            --  - cmd (table): Override the default command used to start the server
            --  - filetypes (table): Override the default list of associated filetypes for the server
            --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --  - settings (table): Override the default settings passed when initializing the server.
            --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
            local servers = {
                -- clangd = {},
                -- gopls = {},
                -- pyright = {},
                -- rust_analyzer = {},
                -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
                --
                -- Some languages (like typescript) have entire language plugins that can be useful:
                --    https://github.com/pmizio/typescript-tools.nvim
                --
                -- But for many setups, the LSP (`ts_ls`) will work just fine
                -- ts_ls = {},
                --
            }

            -- Ensure the servers and tools above are installed
            --
            -- To check the current status of installed tools and/or manually install
            -- other tools, you can run
            --    :Mason
            --
            -- You can press `g?` for help in this menu.
            --
            -- `mason` had to be setup earlier: to configure its options see the
            -- `dependencies` table for `nvim-lspconfig` above.
            --
            -- You can add other tools here that you want Mason to install
            -- for you, so that they are available from within Neovim.
            local ensure_installed = vim.tbl_keys(servers or {})
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for ts_ls)
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
}
