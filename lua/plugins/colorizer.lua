K = {
    "norcalli/nvim-colorizer.lua",
    config = function()
        vim.o.termguicolors = true
        require("colorizer").setup()
    end,
    lazy = false,
}
return K
