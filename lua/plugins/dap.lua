K = {
    { 
        "mfussenegger/nvim-dap",
        keys = {
            {"<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>"},
            {"<leader>dc", "<cmd>lua require('dap').continue()<cr>"},
            {"<leader>dsi", "<cmd>lua require('dap').step_into()<cr>"},
            {"<leader>dso", "<cmd>lua require('dap').step_over()<cr>"},
            {"<leader>dr", "<cmd>lua require('dap').repl.open()<cr>"},
        },
    },

    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup("python")
        end,
    },
}
return K
