K = {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "/home/ubuntu/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      }
    end,
  }

return {}
