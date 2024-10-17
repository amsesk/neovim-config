K = {
    "nvim-neorg/neorg",
    -- run = ":Neorg sync-parsers",
    -- dependencies = { "nvim-lua/plenary.nvim" },
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
        },
    },
    config = true,
}

return K
