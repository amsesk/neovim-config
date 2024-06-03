K = {
    "miversen33/sunglasses.nvim",
    config = true,
    opts = {
        filter_type = "SHADE",
        filter_percent = 0.5,
    },
    keys = {
        { "<leader>sge", "<cmd>SunglassesEnableToggle<cr>", "Toggle sunglasses across all windows." },
        { "<leader>sgp", "<cmd>SunglassesPause<cr>", "Pause sunglasses on this window." },
        { "<leader>sgr", "<cmd>SunglasseeResume<cr>", "Resume sunglasses on this window." },
    },
    lazy = false,
}
return K
