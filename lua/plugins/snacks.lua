K = {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
        scratch = { enabled = true, win = { style = "scratch2" } },
        dashboard = { enabled = true },
        lazygit = { enabled = true },
        bufdelete = { enabled = true },
        zen = { enabled = true },
        dim = { enabled = true },
        win = { enabled = true },
        styles = {
            scratch2 = {
                position = "float",
                title_pos = "center",
                footer_pos = "center",
                row = 0.0,
                backdrop=80,
                -- relative = "editor",
                width = 0.90,
                height = 0.65,
                bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
                minimal = false,
                noautocmd = false,
                zindex = 20,
                wo = { winhighlight = "NormalFloat:Normal" },
                footer_keys = true,
                border = true,
            },
        },
    },
    config = function(_, opts)
        local snacks = require("snacks")
        snacks.setup(opts)
    end,
    keys = {
        {
            "<leader>ro",
            function()
                require("snacks").scratch()
            end,
            desc = "Toggle Scratch Buffer",
        },
        {
            "<leader>rs",
            function()
                require("snacks").scratch.select()
            end,
            desc = "Select Scratch Buffer",
        },
        {
            "<leader>lg",
            function()
                require("snacks").lazygit.open()
            end,
            desc = "Open lazy git via snacks.",
        },
        {
            "<leader>bd",
            function()
                require("snacks").bufdelete()
            end,
            desc = "Delete buffer.",
        },
        {
            "<leader>bdo",
            function()
                require("snacks").bufdelete().other()
            end,
            desc = "Delete all other buffers.",
        },
        {
            "<leader>uzz",
            function()
                require("snacks").zen()
            end,
            desc = "Toggle zen mode.",
        },
        {
            "<leader>uzo",
            function()
                require("snacks").zen.zoom()
            end,
            desc = "Toggle zen zoom.",
        },
    },
}
return K
