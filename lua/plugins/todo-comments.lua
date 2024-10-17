K = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
      keywords = {
          CHUNK = {
              icon = " ",
              color = "hint",
          },
      },
      highlight = {
          multiline = false,
          before = "bg"
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

      }
  }
}
return K
