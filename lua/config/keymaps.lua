vim.keymap.set("x", "<localleader>p", '"_dP')

vim.keymap.set("n", "<leader>c", '"_c')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

--vim.keymap.set("n", "<leader>ww", "<cmd>wincmd w<cr>")
--vim.keymap.set("n", "<leader>wp", "<cmd>wincmd p<cr>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Jittery at the top of files with mini.animate, so just disable
-- vim.keymap.set(
--     "n",
--     "<C-d>",
--     [[<Cmd>lua vim.cmd('normal! <C-d>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
-- )
-- vim.keymap.set(
--     "n",
--     "<C-u>",
--     [[<Cmd>lua vim.cmd('normal! <C-u>'); MiniAnimate.execute_after('scroll', 'normal! zvzz')<CR>]]
-- )

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("n", "<leader>bdd", ":bdelete<cr>")

-- vim.keymap.set("n", "<leader>bn", ":bn<CR>")
-- vim.keymap.set("n", "<leader>bp", ":bp<CR>")

-- Layout keybinds
vim.keymap.set("n", "<leader>lts", ":tab split<CR>")
vim.keymap.set("n", "<leader>ltn", ":tabn<CR>")
vim.keymap.set("n", "<leader>lte", ":tabp<CR>")

local numbering = "rel"
vim.keymap.set("n", "<leader>nn", function()
    if numbering == "abs" then
        vim.o.number = false
        vim.o.relativenumber = true
        numbering = "rel"
    else
        vim.o.relativenumber = false
        vim.o.number = true
        numbering = "abs"
    end
end)

-- Remove for leap
-- vim.keymap.set("n", "s", "<NOP>")

-- vim.keymap.set("n", "m", "<NOP>")

vim.keymap.set("n", "<leader>u", ":UndotreeToggle")

-- tmux repl stuff
vim.keymap.set("n", "<leader>ttm", function()
    Snacks = require("snacks")
    local split_window = vim.fn.system("tmux split-window -v -l 20 -P")
    local new_pane_id = vim.split(split_window, "[.]")[2]
end)

vim.keymap.set("n", "<leader>tlp", function()
    Snacks = require("snacks")
    local tmux_panes = vim.fn.system("tmux list-panes")
    Snacks.win({
        text = tmux_panes,
        width = 0.75,
        height = 0.5,
    })
end)
