K = {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
        { "<leader>tf", "<cmd>ToggleTerm size=40 direction=float<cr>",  "Toggle floating terminal.", mode = {"n"} },
        { "<leader>th", "<cmd>ToggleTerm size=20 direction=horizontal<cr>",  "Toggle floating terminal.", mode = {"n"} },
        { "<C-t>", "<cmd>ToggleTerm<cr>", "Toggle terminal from terminal mode.", mode = {"t"} },

    },
    opts = {
        --size = 20,
        --open_mapping = "<leader>tt",
        --direction = "horizontal",
        start_in_insert = true,
        persist_mode = false,
        close_on_exit  = true,
        insert_mappings = false,

    }
}

return K
