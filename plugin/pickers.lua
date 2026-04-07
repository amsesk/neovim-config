vim.pack.add({
    "https://www.github.com/ibhagwan/fzf-lua.git",
})

fzf_lua = require("fzf-lua").setup(
    {
        winopts = {
            backdrop=100,
            height=0.75,
            width=0.95,

        },
    }
)

vim.keymap.set("n", "<leader>pf", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>pb", "<cmd>FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>pg", "<cmd>FzfLua grep_project<cr>")
vim.keymap.set("n", "<leader>pc", "<cmd>FzfLua colorschemes<cr>")
vim.keymap.set("n", "<leader>pk", "<cmd>FzfLua keymaps<cr>")
vim.keymap.set("n", "<leader>pm", "<cmd>FzfLua marks<cr>")
