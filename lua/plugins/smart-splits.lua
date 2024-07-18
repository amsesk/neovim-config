K = {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    opts = {
        default_amount = 5,
    },
    keys = {
        -- recommended mappings
        -- resizing splits
        -- these keymaps will also accept a range,
        -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
        -- { '<A-h>', "<cmd>lua require('smart-splits').resize_left()<cr>", mode = {"n"} },
        -- { '<A-j>', "<cmd>lua require('smart-splits').resize_down()<cr>", mode = {"n"} },
        -- { '<A-k>', "<cmd>lua require('smart-splits').resize_up()<cr>", mode = {"n"} },
        -- { '<A-l>', "<cmd>lua require('smart-splits').resize_right()<cr>", mode = {"n"} },
        -- moving between splits
        { '<C-h>', "<cmd>lua require('smart-splits').move_cursor_left()<cr>", mode = {"n"} },
        { '<C-j>', "<cmd>lua require('smart-splits').move_cursor_down()<cr>", mode = {"n"} },
        { '<C-k>', "<cmd>lua require('smart-splits').move_cursor_up()<cr>", mode = {"n"} },
        { '<C-l>', "<cmd>lua require('smart-splits').move_cursor_right()<cr>", mode = {"n"} },
        { '<C-\\>', "<cmd>lua require('smart-splits').move_cursor_previous()<cr>", mode = {"n"} },
        -- swapping buffers between windows
        { '<leader><leader>h', "<cmd>lua require('smart-splits').swap_buf_left()<cr>", mode = {"n"} },
        { '<leader><leader>j', "<cmd>lua require('smart-splits').swap_buf_down()<cr>", mode = {"n"} },
        { '<leader><leader>k', "<cmd>lua require('smart-splits').swap_buf_up()<cr>", mode = {"n"} },
        { '<leader><leader>l', "<cmd>lua require('smart-splits').swap_buf_right()<cr>", mode = {"n"} },

        { '<leader><leader>rr', "<cmd>lua require('smart-splits').start_resize_mode()<cr>", mode = {"n"} },
    },

}
return(K)
