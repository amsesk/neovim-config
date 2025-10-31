K = {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            stylerShell = {
                command = "Rscript",
                -- "<(echo 'formatR::tidy_source(\"$FILENAME\", indent = 2, file = \"$FILENAME\")')",
                args = "<(echo 'styler::style_file(\"$FILENAME\")')",
                stdin = false,
            },
            stylua_with_config = {
                command = "stylua",
                args = { "--config-path", os.getenv("HOME") .. "/.config/.stylua.toml", "$FILENAME" },
                stdin = false,
            }, -- cargo install stylua
        },
        formatters_by_ft = {
            lua = { "stylua_with_config" },
            python = { "isort", "black" }, -- pip install isort, pip install git+https://github.com/psf/black
            r = { "stylerShell" },
            julia = { "runic" },
        },
        -- format_on_save = {
        --     -- These options will be passed to conform.format()
        --     timeout_ms = 2000,
        --     lsp_fallback = true,
        -- },
    },
    config = true,
    lazy = false,
    keys = {
        { "<leader>gf", "<cmd>lua require('conform').format({async = true})<cr>", "Format buffer." },
    },
    log_level = vim.log.levels.DEBUG,
}
return K
