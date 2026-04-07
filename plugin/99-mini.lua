vim.pack.add({
    gh("echasnovski/mini.nvim")
})

require("mini.ai").setup()
require("mini.files").setup({
    mappings = {
        go_in = "<cr>",
        go_out = "-",
        mark_goto = "`",
    }
})
require("mini.icons").setup()
require("mini.surround").setup({
    mappings = {
        add = "ys",
        delete = "ds",
        replace = "cr",
    }
})
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
    snippets = {
        gen_loader.from_lang()
    },
    mappings = {
        expand = "<C-p>",
        jump_next = "<C-e>",
        jump_prev = "<C-n>",
        stop = "<C-c>",
    },
})

-- Keys
vim.keymap.set("n", "<leader>pv", "<cmd>lua MiniFiles.open()<cr>")

