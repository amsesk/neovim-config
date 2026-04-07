vim.pack.add({
    gh("echasnovski/mini.nvim"),
    gh("ibhagwan/fzf-lua"),
    gh("otavioschwanck/arrow.nvim"),
})

-- fzf-lua
require("mini.icons")
require("fzf-lua").setup(
    {
        winopts = {
            backdrop=100,
            height=0.75,
            width=0.95,

        },
    }
)

vim.keymap.set("n", "<leader>pf", "<cmd>lua FzfLua.files()<cr>")
vim.keymap.set("n", "<leader>pb", "<cmd>lua FzfLua.buffers()<cr>")
vim.keymap.set("n", "<leader>pg", "<cmd>lua FzfLua.grep_project()<cr>")
vim.keymap.set("n", "<leader>pc", "<cmd>lua FzfLua.colorschemes()<cr>")
vim.keymap.set("n", "<leader>pk", "<cmd>lua FzfLua.keymaps()<cr>")
vim.keymap.set("n", "<leader>pm", "<cmd>lua FzfLua.marks()<cr>")

-- arrow
require("arrow").setup({
    show_icons=false,
    leader_key=";",
})
