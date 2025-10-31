M = {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            options = {
                multilines = {
                    enabled = true
                }
            }
        })
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
    keys = {
        { "<leader>dt", "<cmd>lua require('tiny-inline-diagnostic').toggle()<cr>", "Toggle diagnostic overlays." },
        { "<leader>dc", "<cmd>lua require('tiny-inline-diagnostic').get_diagnostic_under_cursor()<cr>", "Toggle diagnostic overlays." },
    }
}

return M
