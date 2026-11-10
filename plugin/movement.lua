vim.pack.add({
    cb("andyg/leap.nvim"),
    gh("tpope/vim-repeat"),
})

leap = require("leap").setup({})

vim.keymap.set({"n", "x", "o"}, "s", "<Plug>(leap)")
vim.keymap.set({"n"}, "S", "<Plug>(leap-from-window)")
