K = {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    build = ":ScratchInitConfig",
    keys = {
        { "<leader>so", "<cmd>ScratchOpen<cr>", "Open scratch picker." },
        { "<leader>sn", "<cmd>ScratchWithName<cr>", "Open new scratch with name." },
    },
}

return K
