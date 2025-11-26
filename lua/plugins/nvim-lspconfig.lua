M = {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = false,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            -- Setup language servers.
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            -- local lspconfig = require("lspconfig")
            -- vim.lsp.config("lua_ls", {})
            -- lspconfig.basedpyright.setup({
            --     basedpyright = {
            --         --     typeCheckingMode = "standard",
            --         -- },
            --     },
            --     
            -- })
            -- lspconfig.r_language_server.setup({
            --     capabilites = capabilities,
            --     flags = { debounce_text_changes = 150 },
            -- })
            -- lspconfig.julials.setup({})
            -- lspconfig.r_language_server.setup({
            -- settings = {
            --     r = {
            --         lsp = {
            --             server_capabilities = capabilities
            --         },
            --     },
            -- },
            -- capabilities = capabilities,
            --     settings = {
            --         r = {
            --             lsp = {
            --                 log_file = "~/r_languageserver.log",
            --                 diagnostics = true,
            --                 max_completions = 300,
            --                 lint_cache = true,
            --                 link_file_size_limit = 64000,
            --                 server_capabilites = {
            --                     definitionProvider = true,
            --                     completionProvider = true,
            --                     completionItemResolve = true,
            --                 },
            --             },
            --         },
            --     },
            -- })
            -- lspconfig.bashls.setup({ capabilities = capabilities })
            -- lspconfig.clangd.setup({ capabilities = capabilities })
            -- lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            -- lspconfig.marksman.setup({
            --     filetypes = { "markdown", "quarto" },
            --     root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.t            lspconfig.r_language_server.setup({})oml", "_quarto.yml"),
            -- })

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            -- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Explicitly disable virtual text diagnostics
                    vim.diagnostic.config({ virtual_text = false })

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set("n", "<space>wl", function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    -- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    -- vim.keymap.set("n", "<space>f", function()
                    --     vim.lsp.buf.format({ async = true })
                    -- end, opts)
                end,
            })
        end,
    },
    -- {
    --     "L3MON4D3/LuaSnip",
    --     -- follow latest release.
    --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --     -- install jsregexp (optional!).
    --     build = "make install_jsregexp",
    --     config = function(_, opts)
    --         local ls = require("luasnip").setup(opts)
    --         require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
    --         --vim.keymap.set('n', "<C-e>", function() ls.expand() end, {silent = true})
    --     end,
    -- },
    --
    -- add blink.compat
    -- {
    --     "saghen/blink.compat",
    --     -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    --     version = "*",
    --     -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    --     lazy = true,
    --     -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    --     opts = {},
    -- },
    {
        "saghen/blink.cmp",
        lazy = false, -- lazy loading handled internally
        -- optional: provides snippets for the snippet source
        -- dependencies = "L3MON4D3/LuaSnip",

        -- use a release tag to download pre-built binaries
        version = "*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        -- dependencies = {
        -- "jalvesaq/cmp-nvim-r"
        -- },
        opts = {
            keymap = {
                preset = "none",
                ["<C-y>"] = { "accept" },
                ["<C-e>"] = { "select_prev" },
                ["<C-n>"] = { "select_next" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            },
            signature = {
                enabled = true,
            },
            -- snippets = { preset = "luasnip" },
            appearance = {
                nerd_font_variant = "mono",
                use_nvim_cmp_as_default = true,
            },
            sources = {
                -- default = { "lsp", "path", "buffer", "snippets" },
                default = {
                    "lsp",
                    "path",
                    "buffer",
                },

                -- providers = {
                -- create provider
                -- cmp_nvim_r = {
                -- IMPORTANT: use the same name as you would for nvim-cmp
                -- name = "cmp_nvim_r",
                -- module = "blink.compat.source",

                -- all blink.cmp source config options work as normal:
                -- score_offset = -3,

                -- this table is passed directly to the proxied completion source
                -- as the `option` field in nvim-cmp's source config
                --
                -- this is NOT the same as the opts in a plugin's lazy.nvim spec
                -- opts = {
                --   -- this is an option from cmp-digraphs
                --   cache_digraphs_on_start = true,

                -- If you'd like to use a `name` that does not exactly match nvim-cmp,
                -- set `cmp_name` to the name you would use for nvim-cmp, for instance:
                -- cmp_name = "digraphs"
                -- then, you can set the source's `name` to whatever you like.
                -- },
            },
        },
        opts_extend = {
            "sources.default",
        },
    },
}
return M
