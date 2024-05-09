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
        {'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    {'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config =  function()
        --local lsp_zero = require('lsp-zero')
        --lsp_zero.extend_lspconfig()
        require("mason-lspconfig").setup({
            ensure_installed = {"pyright", "bashls", "lua_ls", "rust_analyzer"},
            -- handlers = {
                --   lsp_zero.default_setup,
                --}
            })
        end
    },
    {'neovim/nvim-lspconfig',
    config = function()
        -- Setup language servers.
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup {}
        lspconfig.pyright.setup {}
        lspconfig.r_language_server.setup {
            -- settings = {
            --     r_language_server = {
            --         diagnostics = false
            --     }
            -- }
        }

        lspconfig.lua_ls.setup {}

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
        end
    },
    {'hrsh7th/cmp-nvim-lsp'},
    --{'hrsh7th/cmp-nvim-lsp-signature-help'},
    {'hrsh7th/nvim-cmp',
        config = function(_, opts)
            local cmp = require('cmp')
            cmp.setup({
                sources={
                    {name="nvim_lsp"},
                    {name="nvim_lsp_signature_help"},
                    {name="buffer"},
                    {
                        name="path",
                        option = {
                            --get_cwd = function()
                            --end
                        }
                    },
                    {name = "luasnip"}
                },
                -- formatting = cmp_format,
                snippet = {
                    expand = function(args)
                        local ls = prerequire("luasnip")
                        if not ls then
                            return
                        end
                        ls.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),

                }
            })
        end
    },
    {"saadparwaiz1/cmp_luasnip"},
    {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
        config = function(_, opts)
            local ls = require("luasnip").setup(opts)
            --vim.keymap.set('n', "<C-e>", function() ls.expand() end, {silent = true})
        end,
    }
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
