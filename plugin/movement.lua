vim.pack.add({
    cb("andyg/leap.nvim"),
    gh("tpope/vim-repeat"),
    gh("mrjones2014/smart-splits.nvim"),
})

leap = require("leap").setup({})

-- vim.keymap.set({"n", "x", "o"}, "s", function()
--     require("leap").leap({target_windows={vim.api.nvim_get_current_win()}})
-- end)
vim.keymap.set({"n", "x", "o"}, "s", "<Plug>(leap)")
vim.keymap.set({"n"}, "S", "<Plug>(leap-from-window)")


-- Smart splits
require("smart-splits").setup({
        default_amount = 5,
    }
)

vim.keymap.set("n", '<A-h>', "<cmd>lua require('smart-splits').resize_left()<cr>")
vim.keymap.set("n", '<A-j>', "<cmd>lua require('smart-splits').resize_down()<cr>")
vim.keymap.set("n", '<A-k>', "<cmd>lua require('smart-splits').resize_up()<cr>")
vim.keymap.set("n", '<A-l>', "<cmd>lua require('smart-splits').resize_right()<cr>")

vim.keymap.set("n", '<C-h>', "<cmd>lua require('smart-splits').move_cursor_left()<cr>")
vim.keymap.set("n", '<C-j>', "<cmd>lua require('smart-splits').move_cursor_down()<cr>")
vim.keymap.set("n", '<C-k>', "<cmd>lua require('smart-splits').move_cursor_up()<cr>")
vim.keymap.set("n", '<C-l>', "<cmd>lua require('smart-splits').move_cursor_right()<cr>")

vim.keymap.set("n", '<leader><leader>h', "<cmd>lua require('smart-splits').swap_buf_left()<cr>")
vim.keymap.set("n", '<leader><leader>j', "<cmd>lua require('smart-splits').swap_buf_down()<cr>")
vim.keymap.set("n", '<leader><leader>k', "<cmd>lua require('smart-splits').swap_buf_up()<cr>")
vim.keymap.set("n", '<leader><leader>l', "<cmd>lua require('smart-splits').swap_buf_right()<cr>")

vim.keymap.set("n", '<leader><leader>rr', "<cmd>lua require('smart-splits').start_resize_mode()<cr>")
