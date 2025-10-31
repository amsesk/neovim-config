local mini_files_opts = {
    mappings = {
        go_in = "<CR>",
        go_out = "-",
        mark_goto = "`",
    },
}
local function mini_ai_opts()
    local nn = require("notebook-navigator")
    local opts = {
        custom_textobjects = {
            n = nn.miniai_spec,
            q = function()
                local start_line = vim.fn.search("^```{\\a\\+}\\s*$", "bcnW") + 1
                -- if start_line > 0 then
                -- else
                --     local start_line = vim.fn.search("^```{\\a\\+}", "nW") + 1
                --     local r, _c = table.unpack(vim.api.nvim_win_get_cursor(0))k
                --     local diff = start_line - r
                --     vim.cmd(diff .. "j")
                -- end
                local end_line_above = vim.fn.search("^```\\s*$", "bcnW") - 1
                local end_line
                if end_line_above > start_line then
                    end_line = end_line_above
                else
                    end_line = vim.fn.search("^```\\s*$", "nW") - 1
                end
                local last_col = math.max(vim.fn.getline(end_line):len(), 1)
                local from = { line = start_line, col = 1 }
                local to = { line = end_line, col = last_col }
                return { from = from, to = to }
            end,
        },
    }
    return opts
end

-- local function statusline_setup()
--     vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "Love", fg = "Surface" })
--     vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "Gold", fg = "Surface" })
--     vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = "Iris" })
-- end

K = {
    "echasnovski/mini.nvim",
    version = false,
    dependencies = {
        -- { "nvim-tree/nvim-web-devicons", lazy = false },
    },
    config = function(_, _opts)
        require("mini.icons").setup()
        require("mini.files").setup(mini_files_opts)

        -- Setup mini.snippets
        local gen_loader = require('mini.snippets').gen_loader
        require('mini.snippets').setup({
            snippets = {
                -- Load custom file with global snippets first
                -- gen_loader.from_file('~/.config/nvim/snippets/global.json'),

                -- Load snippets based on current language by reading files from
                -- "snippets/" subdirectories from 'runtimepath' directories.
                gen_loader.from_lang(),
            },
            mappings = {
                -- Expand snippet at cursor position. Created globally in Insert mode.
                expand = '<C-j>',

                -- Interact with default `expand.insert` session.
                -- Created for the duration of active session(s)
                jump_next = '<C-l>',
                jump_prev = '<C-h>',
                stop = '<C-c>',
            },

        })
		--       require("mini.pairs").setup({
		-- mappings = {
		--     ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][^a-zA-Z0-9]' },
		--    },
		--       })
        -- require('mini.visits').setup()
        -- require("mini.pick").setup()
        -- require("mini.diff").setup()
        require("mini.statusline").setup()
        require("mini.sessions").setup()
        -- statusline_setup()
        require("mini.animate").setup({
            cursor = {
                timing = require("mini.animate").gen_timing.linear({ duration = 175, unit = "total" }),
            },
            scroll = {
                timing = require("mini.animate").gen_timing.linear({ duration = 175, unit = "total" }),
            },
        })
        require("mini.ai").setup(mini_ai_opts())
        require("mini.surround").setup({
            mappings = {
                add = "ys", -- Add surrounding in Normal and Visual modes
                delete = "ds", -- Delete surrounding
                find = "", -- Find surrounding (to the right)
                find_left = "", -- Find surrounding (to the left)
                highlight = "", -- Highlight surrounding

                replace = "cs", -- Replace surrounding
                update_n_lines = "", -- Update `n_lines`

                suffix_last = "", -- Suffix to search with "prev" method
                suffix_next = "", -- Suffix to search with "next" method
            },
        })
        -- require("mini.indentscope").setup()
        -- require("mini.git").setup()
       -- require("mini.jump").setup({
        --     mappings = {
        --         repeat_jump = '',
        --     },
        --     delay = {
        --         idle_stop = 2500,
        --     },
        -- })
    end,
    keys = {
        -- { "<leader>ht", "<cmd>horiz Git status<cr>", "Mini git status" },
        -- { "<leader>hC", "<cmd>horiz Git commit<cr>", "Mini git commit." },
        -- { "<leader>hl", "<cmd>horiz Git log<cr>", "Mini git commit." },
        { "<leader>pv", "<cmd>lua MiniFiles.open()<cr>", "Open mini-files." },
        { "<leader>msr", "<cmd>lua MiniSessions.read()<cr>", "Read MiniSessions session." },
        { "<leader>msw", "<cmd>lua MiniSessions.write()<cr>", "Write MiniSessions session." },
        -- { "<C-i>", "<cmd>lua MiniVisits.iterate_paths('')<cr>", "Go to next visit." },
        -- { "<C-h>", "<cmd>lua MiniVisits.iterate_paths('backward')<cr>", "Go to last visit." },
        -- { "<leader>hh", "<cmd>lua MiniPick.start({ source = { items = MiniVisits.list_paths() } })<cr>", "Go to last visit." },
    },
    lazy = false,
}
return K
