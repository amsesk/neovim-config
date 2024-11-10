M = {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        styles = {
            keywords = {italic = true}
        }
    },
    config = function(_, opts)
        require("oldworld").setup(opts)
    end,
}
return M
