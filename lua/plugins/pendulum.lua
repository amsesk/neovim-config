K = {
    "ptdewey/pendulum-nvim",
    opts = {
        gen_reports = true,
    },
    config = function()
        require("pendulum").setup()
    end,
}
return K
