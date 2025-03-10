M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.nvim",
    "MunifTanjim/nui.nvim",
    -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { "<leader>ut", "<cmd>Neotree toggle<cr>", "Toggle Neotree window." },
},
}
return M
