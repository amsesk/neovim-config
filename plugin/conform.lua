vim.pack.add({
    "http://www.github.com/stevearc/conform.nvim",
})

require("conform").setup({
    formatters = {
        stylua_with_config = {
            command = "stylua",
            args = { "--config-path", os.getenv("HOME") .. "/.config/.stylua.toml", "$FILENAME" },
            stdin = false,
        }, -- cargo install stylua
        air = {
            command = "air",
            args = { "format", "$FILENAME" },
        }
    },
    formatters_by_ft = {
        lua = { "stylua_with_config" },
        python = { "isort", "black" }, -- pip install isort, pip install git+https://github.com/psf/black
        r = { "air" },
        julia = { "runic" },
    },
})

vim.keymap.set("n", "<leader>gf", "<cmd>lua require('conform').format({async = true})<cr>")
