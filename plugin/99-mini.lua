vim.pack.add({
    gh("echasnovski/mini.nvim"),
})

require("mini.ai").setup({
    -- custom_textobjects = {
    --     h = require("notebook-navigator").miniai_spec,
    --     x = {"# %%"},
    -- },
})

require("mini.jump").setup()
require("mini.surround").setup({
    mappings = {
        add = "ys",
        delete = "ds",
        replace = "cr",
        highlight = "",
        replace = "",
        find = "",
        find_left = "",
    },
})
