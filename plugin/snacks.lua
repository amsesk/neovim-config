vim.pack.add({
    gh("folke/snacks.nvim")
})

require("snacks").setup({
    bufdelete = { enabled = true },
    lazygit = { enabled = true },
})

local snacks = require("snacks")

vim.keymap.set("n", "<leader>lg", function() snacks.lazygit.open() end)
vim.keymap.set("n", "<leader>bd", function() snacks.bufdelete() end)
