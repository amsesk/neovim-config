K = {
    -- dir = "/home/ubuntu/dev/neovim/NotebookNavigator.nvim",
    "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    --{ "]h", function() require("notebook-navigator").move_cell "d" end },
    --{ "[h", function() require("notebook-navigator").move_cell "u" end },
    { "<leader>sc", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { "<leader>vc", function()
        require('notebook-navigator').move_cell('u')
        vim.api.nvim_feedkeys("v", "t", false)
        require('notebook-navigator').move_cell('d')
    end,},
  },
  dependencies = {
    "echasnovski/mini.comment",
    -- "hkupty/iron.nvim", -- repl provider
    "akinsho/toggleterm.nvim", -- alternative repl provider
    -- "benlubas/molten-nvim", -- alternative repl provider
    "anuvyklack/hydra.nvim",
  },
  event = "VeryLazy",
  config = function()
    local nn = require "notebook-navigator"
    nn.setup({ activate_hydra_keys = "<leader>hh" })
  end,
}

return K
