K = {
    "ryanmsnyder/toggleterm-manager.nvim",
    keys = {
        --{"<leader>tt", "<cmd>Telescope toggleterm_manager<cr>", "Open toggleterm manager."},
    },
    dependencies = {
        "akinsho/nvim-toggleterm.lua",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
    config = true,
}
return K
