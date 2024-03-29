local mini_files_opts = {
    mappings = {
        go_in = '<CR>',
        go_out = '-',
    }
}

local function mini_ai_opts()
    local nn = require("notebook-navigator")
    local opts = { 
        custom_textobjects = {
            h = nn.miniai_spec
        }
    }
    return opts
end

local function statusline_setup()
    vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "Love", fg = "Surface" })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "Gold", fg = "Surface" })
    vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = "Iris" })
end

    
K = { 'echasnovski/mini.nvim', 
    version = false,
    dependencies = { 
        { "nvim-tree/nvim-web-devicons", lazy = false },
    },
    config = function(_, _opts)
        -- require("mini.files").setup(mini_files_opts)
        require("mini.statusline").setup()
        -- statusline_setup()
        -- require('mini.visits').setup()
        require('mini.pick').setup()
        require('mini.ai').setup()
    end,
    keys = {
        -- { "<leader>pv", "<cmd>lua MiniFiles.open()<cr>", "Open mini-files." },
        -- { "<C-i>", "<cmd>lua MiniVisits.iterate_paths('forward')<cr>", "Go to next visit." },
        -- { "<C-h>", "<cmd>lua MiniVisits.iterate_paths('backward')<cr>", "Go to last visit." },
        -- { "<leader>hh", "<cmd>lua MiniPick.start({ source = { items = MiniVisits.list_paths() } })<cr>", "Go to last visit." },
    },
    lazy = false,
}
return K
