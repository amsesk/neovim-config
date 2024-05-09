M = {
    dir = "/home/ubuntu/dev/neovim/toggleterm-repl.nvim/",
    lazy = false,
    keys = {
        { "<C-t>", "<cmd>ToggleTermFtReplNew<cr>", "Toggle terminal from terminal mode.", mode = { "t", "n" } },
        {
            "<leader>ll",
            "<cmd>lua require('toggleterm-repl').stuff.send_line()<cr>",
            "Send line to toggle term.",
            mode = { "n" },
        },
        {
            "<leader>ss",
            "<cmd>lua require('toggleterm-repl').stuff.send_lines()<cr>",
            "Send line to toggle term.",
            mode = { "v" },
        },
        { "<leader>cc", "<cmd>lua require('toggleterm-repl').stuff.run_cell_and_move()<cr>", mode = { "n" } },
        {
            "<leader>tt",
            "<cmd>lua require('toggleterm-repl').stuff._create_window()<cr>",
            "Open list of repls.",
            mode = { "n" },
        },
        { "<leader>ee", "?^# %%$<cr>NVn", "Send line to toggle term.", mode = { "n" } },
        --{ "<leader>cc", "?^# %%$<cr>ma<esc>Nmb<esc>`aV`b<leader>ss", "Send line to toggle term.", mode = {"n"} },
    },
    dependencies = {
        "akinsho/nvim-toggleterm.lua",
        "ryanmsnyder/toggleterm-manager.nvim",
        "GCBallesteros/NotebookNavigator.nvim",
    },
    config = true,
}

return M
