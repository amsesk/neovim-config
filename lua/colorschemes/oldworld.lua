M = {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {
	variant = "cooler",
        styles = {
            keywords = {italic = true}
        },
        highlight_overrides = {
            -- Folded = { bg = "#85b5ba", fg = "#161617" },
            Folded = { bg = "#4C4C5C", fg = "#c9c7cd" },
        },
    },
    config = function(_, opts)
        require("oldworld").setup(opts)
    end,
}
return M
