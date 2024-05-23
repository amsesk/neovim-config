K = {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    dependencies = {
        "3rd/image.nvim",
    },
    init = function()
        -- this is an example, not a default. Please see the readme for more configuration options
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_virt_text_output = false
    end,
    keys = {
        { "<leader>mi", "<cmd>MoltenInit<cr>" },
        { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>" },
        { "<leader>mo", "<cmd>MoltenEvaluateOperator<cr>" },
        { "<leader>ms", ":<C-u>MoltenEvaluateVisual<cr>", "", mode = { "v" } },
        { "<leader>moh", ":MoltenHideOutput<cr>", "", mode = { "n" } },
        { "<leader>mos", ":MoltenShowOutput<cr>", "", mode = { "n" } },
        {
            "<leader>mcs",
            function()
                require("mini.ai").select_textobject("a", "b", { vis_mode = "v", operator_pending = false })
                local keys = vim.api.nvim_replace_termcodes(":<C-u>MoltenEvaluateVisual<cr>", true, true, true)
                vim.api.nvim_feedkeys(keys, "n", false)
            end,
            "",
            mode = { "n" },
        },
        {
            "<leader>mcn",
            function()
                local next_head = vim.fn.search("^```{\\a\\+}\\s*$", "nW")
                vim.api.nvim_win_set_cursor(0, { next_head + 1, 0 })
            end,
            "Move down to next code block."
        },
        {
            "<leader>mcp",
            function()
                local last_head = vim.fn.search("^```{\\a\\+}\\s*$", "bnW")
                local last_tail = vim.fn.search("^```\\s*$", "bnW")
                local previous_block
                if last_head > last_tail then
                    -- We are inside a block, so go to top of current block and then to previous
                    vim.api.nvim_win_set_cursor(0, { last_tail - 1, 0 })
                    previous_block = require("mini.ai").find_textobject("a", "b", { search_method = "cover" })
                else
                    -- We are in between blocks, so go straight to previous
                    vim.api.nvim_win_set_cursor(0, { last_head, 0 })
                    previous_block = require("mini.ai").find_textobject("a", "b", { search_method = "cover" })
                end
                vim.api.nvim_win_set_cursor(0, { previous_block.from.line, 0 })
            end,
            "Move up to the previous code block.",
        },
    },
}

return K
