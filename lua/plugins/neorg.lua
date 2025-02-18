K = {
    "nvim-neorg/neorg",
    -- run = ":Neorg sync-parsers",
    dependencies = { "3rd/image.nvim" },
    lazy = false,
    version = "*",
    opts = {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        work = "/home/ubuntu/dev/neorg-work",
                    },
                    default_workspace = "work",
                },
            },
            -- ["core.latex.renderer"] = {
            --     config = {
            --         conceal = false,
            --         scale = 3,
            --     },
            -- },
            ["core.autocommands"] = {},
            ["core.highlights"] = {},
            ["core.integrations.treesitter"] = {},
            ["core.neorgcmd"] = {},
            ["core.integrations.image"] = {},
        },
    },
    config = true,
}

return K
