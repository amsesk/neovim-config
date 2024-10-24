K = {
    "rcarriga/nvim-notify",
    config = function(_, opts)
        local notify = require("notify")
        notify.setup(opts)
        vim.notify = notify
    end,
    lazy = false,
}
return K
