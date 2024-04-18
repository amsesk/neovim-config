K = {
    {'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        --init = function()
            -- Disable automatic setup, we are doing it manually
         --   vim.g.lsp_zero_extend_cmp = 0
         --   vim.g.lsp_zero_extend_lspconfig = 0
        --end,
    },
    {'williamboman/mason.nvim',
    	lazy = false,
	config = true,
	},
    {'williamboman/mason-lspconfig.nvim',
        config =  function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            require("mason-lspconfig").setup({
            ensure_installed = {"r_language_server", "pyright", "bashls", "lua_ls", "rust_analyzer"},
            handlers = {
                lsp_zero.default_setup,
            }
        })
        end
    },
    {'neovim/nvim-lspconfig',},
        config = function() 
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)
        end,
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp',
        config = function(_, opts)
            local cmp_format = require('lsp-zero').cmp_format()
            require("cmp").setup({
                sources={
                    {name="nvim_lsp"},
                    {
                        name="path",
                        option = {
                            --get_cwd = function()
                            --end
                        }
                    },
                    {name = "luasnip"}
                },
                formatting = cmp_format,
                snippet = {
                    expand = function(args)
                        local ls = prerequire("luasnip")
                        if not ls then
                            return
                        end
                        ls.lsp_expand(args.body)
                    end,
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
	build = "make install_jsregexp"
    }
}

--return K
return {}

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
