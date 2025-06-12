K = {
    "sindrets/diffview.nvim", -- optional - Diff integration
    opts = {
        use_icons = false,
    },
    keys = {
        { "<leader>dvo", mode = { "n" }, "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
        { "<leader>dvc", mode = { "n" }, "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
        { "<leader>dvh", mode = { "n" }, "<cmd>DiffviewFileHistory<cr>", desc = "Open Diffview file history" },
    },
    config = true,
}
return K

