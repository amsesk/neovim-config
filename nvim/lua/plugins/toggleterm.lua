K = {
    --'amsesk/toggleterm.nvim',
    dir = "/home/ubuntu/dev/neovim/toggleterm.nvim",
    version = "*",
    keys = {
        --{ "<leader>tt", "<cmd>ToggleTerm size=20 direction=horizontal<cr>",  "Toggle floating terminal.", mode = {"n"} },
    },
    opts = {
        size = 20,
        open_mapping = nil,
        direction = "horizontal",
        start_in_insert = true,
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
