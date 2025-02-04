M = {
    -- {'VonHeikemen/lsp-zero.nvim',
    --    branch = 'v3.x',
    --    lazy = true,
    --    config = false,
    --init = function()
    -- Disable automatic setup, we are doing it manually
    --   vim.g.lsp_zero_extend_cmp = 0
    --   vim.g.lsp_zero_extend_lspconfig = 0
    --end,
    --},
    { "williamboman/mason.nvim", lazy = false, config = true },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            --local lsp_zero = require('lsp-zero')
            --lsp_zero.extend_lspconfig()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer" },
                -- handlers = {
                --   lsp_zero.default_setup,
                --}
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            -- Setup language servers.
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                    },
                },
            })
            lspconfig.basedpyright.setup({
                basedpyright = {
                    -- analysis = {
                    --     typeCheckingMode = "standard",
                    -- },
                },
            })

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.r_language_server.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            -- lspconfig.marksman.setup({
            --     filetypes = { "markdown", "quarto" },
            --     root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", "_quarto.yml"),
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

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<space>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function(_, opts)
            local ls = require("luasnip").setup(opts)
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
            --vim.keymap.set('n', "<C-e>", function() ls.expand() end, {silent = true})
        end,
    },
    {
        "saghen/blink.cmp",
        lazy = false, -- lazy loading handled internally
        -- optional: provides snippets for the snippet source
        dependencies = "L3MON4D3/LuaSnip",

        -- use a release tag to download pre-built binaries
        version = "*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "none",
                ["<C-y>"] = { "accept" },
                ["<C-p>"] = { "select_prev" },
                ["<C-n>"] = { "select_next" },
            },
            signature = {
                enabled = true,
            },
            snippets = { preset = "luasnip" },
            appearance = {
                nerd_font_variant = "mono",
                use_nvim_cmp_as_default = true,
            },
            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
            },
        },
        opts_extend = {
            "sources.default",
        }
    },
    -- {  },
    --{'hrsh7th/cmp-nvim-lsp-signature-help'},
    -- {
    --     "hrsh7th/nvim-cmp",
    --     -- dependencies = { "jmbuhr/otter.nvim" },
    --     config = function(_, opts)
    --         local cmp = require("cmp")
    --         cmp.setup({
    --             sources = {
    --                 { name = "nvim_lsp" },
    --                 { name = "nvim_lsp_signature_help" },
    --                 { name = "buffer" },
    --                 -- { name = "otter" },
    --                 {
    --                     name = "path",
    --                     option = {
    --                         --get_cwd = function()
    --                         --end
    --                     },
    --                 },
    --                 { name = "luasnip" },
    --             },
    --             -- formatting = cmp_format,
    --             snippet = {
    --                 expand = function(args)
    --                     local ls = prerequire("luasnip")
    --                     if not ls then
    --                         return
    --                     end
    --                     ls.lsp_expand(args.body)
    --                 end,
    --             },
    --             mapping = {
    --                 ["<C-n>"] = cmp.mapping.select_next_item(),
    --                 ["<C-p>"] = cmp.mapping.select_prev_item(),
    --                 ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    --             },
    --         })
    --     end,
    -- },
    -- { "saadparwaiz1/cmp_luasnip" },
}

return M

-- Primeagen apparently outdated keybinding config
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
--    ["<C-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
--    ["<CR>"] = cmp.mapping.confirm({select=true}),
--    ["<C-Space>"] = cmp.mapping.complete(),
--})

--local cmp = require("cmp")
--cmp.setup({
--  mapping = cmp.mapping.preset.insert({
--      ["<Tab>"] = cmp.mapping.select_next_item({behavior = "select"}),
--      ["<C-Tab>"] = cmp.mapping.select_prev_item({behavior = "select"}),
--      ['<CR>'] = cmp.mapping.confirm({select = true}),
--  })
--})
