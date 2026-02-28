K = {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    --@module "fzf_lua"
    --@type fzf.lua.Config()
    --@diagnostic disable: missing-fields
    --@diagnostic enable: missing-fields
    lazy = false,
    opts = {
        fzf_colors = {
            -- ["bg"] = {"bg", { "Normal" }, },
            -- ["preview-bg"] = "red",
            -- ["preview-border"] = {"bg", { "Normal" }, },
        },
        winopts = {
            backdrop = 100,
            height = 0.75,
            width = 0.95,
        },
    },
    config = function(_, opts)
        -- calling `setup` is optional for customization
        fzf = require("fzf-lua")
        fzf.setup(opts)
        fzf.register_ui_select()
    end,
    keys = {
        { "<leader>pb", "<cmd>FzfLua buffers winopts.preview.hidden=hidden<cr>", desc = "Fuzzy find buffers." },
        { "<leader>pf", "<cmd>FzfLua files<cr>", desc = "Fuzzy find files." },
        { "<leader>pg", "<cmd>FzfLua grep_project<cr>", desc = "Live grep within current project." },
        { "<leader>pc", "<cmd>FzfLua colorschemes<cr>", desc = "Fuzzy find colorschemes." },
        { "<leader>pk", "<cmd>FzfLua keymaps<cr>", desc = "Fuzzy find keymaps." },
        { "<leader>pm", "<cmd>FzfLua marks<cr>", desc = "Fuzzy find marks." },
    },
}

return K
