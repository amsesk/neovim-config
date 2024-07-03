K = {
    "lewis6991/gitsigns.nvim",
    config = true,
    lazy = false,
    keys = {
            { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk", mode = {"n", "v"} },
            { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk", mode = {"n", "v"} },
            { "<leader>htl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlights.", mode = {"n", "v"} },
        },
    }
return K
