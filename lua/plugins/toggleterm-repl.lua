local plugin_dir = os.getenv("HOME") .. "/dev/toggleterm-repl.nvim"
M = {
    -- "amsesk/toggleterm-repl.nvim",
    dir = plugin_dir,
    lazy = true,
    keys = {
        { "<leader>ttr", "<cmd>ToggleTermFtReplNew<cr>", "Open a new filetype repl.", mode = { "n" } },
        -- { "<C-T>", "<cmd>TT:<cr>", "Toggle terminal from terminal mode.", mode = { "t", "n" } },
        {
            "<leader>ll",
            "<cmd>lua require('toggleterm-repl').stuff.send_line()<cr>",
            "Send line to toggle term.",
            mode = { "n" },
        },
        {
            "<leader>ss",
            "<cmd>lua require('toggleterm-repl').stuff.send_lines()<cr>",
            "Send line to toggle term.",
            mode = { "v" },
        },
        {
            "<leader>sv",
            "<cmd>lua require('toggleterm-repl').stuff.send_visual_selection()<cr>",
            "Send visual selection to toggle term.",
            mode = { "v" },
        },
        {
            "<leader>sw",
            "viw<cmd>lua require('toggleterm-repl').stuff.send_visual_selection()<cr><esc>",
            -- function()
            --     vim.api.nvim_feedkeys("viw", "n", false)
            --     require('toggleterm-repl').stuff.send_visual_selection()
            --     vim.api.nvim_feedkeys("<Esc>", "v", true)
            -- end,
            "Send word to toggle term.",
            mode = { "n" },
        },
        { "<leader>cc", "<cmd>lua require('toggleterm-repl').stuff.run_cell_and_move()<cr>", mode = { "n" } },
        -- {
        --     "<leader>tt",
        --     "<cmd>lua require('toggleterm-repl').stuff._create_window()<cr>",
        --     "Open list of repls.",
        --     mode = { "n" },
        -- },
        -- { "<leader>ee", "?^# %%$<cr>NVn", "Send line to toggle term.", mode = { "n" } },
        {
            "<leader>tp",
            function()
                local ttr = require("toggleterm-repl").stuff
                ttr._new_repl(ttr.replopts.py, "py1", true):open()
            end,
        },
        --{ "<leader>cc", "?^# %%$<cr>ma<esc>Nmb<esc>`aV`b<leader>ss", "Send line to toggle term.", mode = {"n"} },
    },
    dependencies = {
        "akinsho/nvim-toggleterm.lua",
        "GCBallesteros/NotebookNavigator.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = true,
}

return M
