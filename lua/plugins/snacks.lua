K = {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
      scratch = { enabled = true },
      dashboard = { enabled = true },
      lazygit = { enabled = true },
      bufdelete = { enabled = true },
  },
  config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)
  end,
  keys = {
    { "<leader>ro",  function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>rs",  function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>lg",  function() require("snacks").lazygit.open() end, desc = "Open lazy git via snacks." },
    { "<leader>bd",  function() require("snacks").bufdelete() end, desc = "Delete buffer." },
    { "<leader>bdo",  function() require("snacks").bufdelete().other() end, desc = "Delete all other buffers." },
  }
}
return K
