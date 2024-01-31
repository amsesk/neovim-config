K = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    label = {
        style = "overlay",
            jump_labels = false,
    },
    modes = {
        search = {
            highlight = {
                backdrop = true,
            },
        },
        char = {
            jump_labels = false,
            keys = { "f", "F", "t", "T", ";", "," },
            highlight = {
                groups = {
                    label = "FlashCharSearch", -- create new highlight group for char search so labels can vary from regular search
                },
            },
        },
    }
  },
  -- stylua: ignore
  keys = {
      { "<leader>nh", "<cmd>nohl<cr>", "Remove highlighting, including from Flash." },
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

return K
