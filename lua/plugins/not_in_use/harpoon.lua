K = {
    'ThePrimeagen/harpoon',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",  "Toggle harpoon quick menu.", mode = {"n"} },
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>",  "Mark file with to harpoon.", mode = {"n"} },
        { "<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>",  "Go to next harpoon file.", mode = {"n"} },
        { "<C-e>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",  "Go to previous harpoon.", mode = {"n"} },
    },
}

-- return K
return {}
