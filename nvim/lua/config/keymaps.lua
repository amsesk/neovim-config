vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>c", "\"_c")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("t", "<leader>ww", "<C-\\><C-n><C-w>w")
vim.keymap.set("n", "<leader>ww", "<C-W>w")
vim.keymap.set("n", "<leader>wp", "<C-W>W")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bp", ":bp<CR>")

local numbering = "rel"
vim.keymap.set("n", "<leader>nn", function()
    if numbering=="abs" then
        vim.o.number=false
        vim.o.relativenumber=true
        numbering="rel"
    else
        vim.o.relativenumber=false
        vim.o.number=true
        numbering="abs"
    end
end)

vim.keymap.set("n", "s", "<NOP>")
