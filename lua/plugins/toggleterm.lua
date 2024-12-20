K = {
    'akinsho/toggleterm.nvim',
    -- dir = "/home/ubuntu/dev/neovim/toggleterm.nvim",
    version = "*",
    keys = {
        --{ "<leader>tt", "<cmd>ToggleTerm size=20 direction=horizontal<cr>",  "Toggle floating terminal.", mode = {"n"} },
        { "<C-t>f", "<cmd>ToggleTerm direction=floating<cr>",  "Toggle terminal floating.", mode = {"n"} },
        { "<C-t>h", "<cmd>ToggleTerm direction=horizontal<cr>",  "Toggle terminal horizontal.", mode = {"n"} },
        { "<C-t>", "<cmd>ToggleTerm direction=horizontal<cr>",  "Toggle terminal from terminal mode.", mode = {"t"} },
        { "<leader>pt", "<cmd>TermSelect<cr>",  "Open terminal selection ui from toggleterm.", mode = {"n"} },
    },
    opts = {
        size = 20,
        open_mapping = nil,
        direction = "horizontal",
        start_in_insert = false,
        persist_mode = false,
        close_on_exit  = true,
        insert_mappings = false,
        winbar = {
            enabled = true,
        },
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end,
}

return K
