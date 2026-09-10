vim.pack.add({
    gh("rachartier/tiny-inline-diagnostic.nvim"),
})

require("tiny-inline-diagnostic").setup({
    options = {
        multilines = {
            enabled = true,
        },
    },
})

vim.diagnostic.config({ virtual_text = false })

vim.cmd("TinyInlineDiag disable")

vim.keymap.set("n", "<leader>dt", "<cmd>TinyInlineDiag toggle<cr>")
