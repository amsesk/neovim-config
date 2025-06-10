M = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "ellisonleao/gruvbox.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "marko-cerovac/material.nvim" },
    { "mellow-theme/mellow.nvim" },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nordic").load()
        end,
    },
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            variant = "cooler",
            styles = {
                keywords = { italic = true },
            },
            highlight_overrides = {
                -- Folded = { bg = "#85b5ba", fg = "#161617" },
                Folded = { bg = "#4C4C5C", fg = "#c9c7cd" },
            },
        },
        config = function(_, opts)
            require("oldworld").setup(opts)
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            highlight_groups = {
                FlashBackdrop = { fg = "Muted" },
                FlashCursor = { fg = "Love", bg = "Base" },
                Search = { fg = "Iris", bg = "Base" },
                CurSearch = { fg = "Iris", bg = "Overlay" },
                FlashLabel = { fg = "Love", bg = "Overlay" },
                FlashCharSearch = { fg = "Love", bg = "Base" }, -- f,F,t,T elswhere
                Visual = { bg = "Muted" },
            },
        },
    },
    { "sainnhe/sonokai" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "WTFox/jellybeans.nvim" },
    { "savq/melange-nvim" },
    { "nyoom-engineering/nyoom.nvim" },
    { "olimorris/onedarkpro.nvim" },
    {
        "ribru17/bamboo.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("bamboo").setup({
                -- optional configuration here
            })
            require("bamboo").load()
        end,
    },
}
return M
