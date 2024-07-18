K = {
    "lewis6991/gitsigns.nvim",
    config = true,
    lazy = false,
    keys = {
            { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk", mode = {"n", "v"} },
            { "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer", mode = {"n", "v"} },
            { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk", mode = {"n", "v"} },
            { "<leader>hv", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlights.", mode = {"n", "v"} },
            { "<leader>hA", "<cmd>Gitsigns attach<cr>", desc = "Attach gitsigns to the current buffer.", mode = {"n", "v"} },
        },
    }
return K
