K = { 'echasnovski/mini.nvim', 
    version = false,
    dependencies = { 
        { "nvim-tree/nvim-web-devicons", lazy = false },
    },
    opts = {
        mappings = {
            go_in = '<CR>',
            go_out = '-',
        }
    },
    config = function(_, opts)
        require("mini.files").setup(opts)
    end,
    keys = {
        { "<leader>pv", "<cmd>lua MiniFiles.open()<cr>", "Open mini-files." }
    },
    lazy = false,
}
return K

