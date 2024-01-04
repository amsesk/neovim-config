local mini_files_opts = {
    mappings = {
        go_in = '<CR>',
        go_out = '-',
    }
}
    
K = { 'echasnovski/mini.nvim', 
    version = false,
    dependencies = { 
        { "nvim-tree/nvim-web-devicons", lazy = false },
    },
    opts = {
    },
    config = function(_, _opts)
        require("mini.files").setup(mini_files_opts)
        require("mini.statusline").setup()
        require('mini.visits').setup()
        require('mini.pick').setup()
    end,
    keys = {
        { "<leader>pv", "<cmd>lua MiniFiles.open()<cr>", "Open mini-files." },
        { "<C-i>", "<cmd>lua MiniVisits.iterate_paths('forward')<cr>", "Go to next visit." },
        { "<C-h>", "<cmd>lua MiniVisits.iterate_paths('backward')<cr>", "Go to last visit." },
    },
    lazy = false,
}
return K

