K = {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
      scratch = { enabled = true },
      dashboard = { enabled = true },
  },
  config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)
  end,
  keys = {
    { "<leader>So",  function() snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>Ss",  function() snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  }
}
return K
