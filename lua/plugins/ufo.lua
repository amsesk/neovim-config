M = {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function(_, opts)
        vim.o.foldcolumn = "auto:9"
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        vim.keymap.set("n", "zP", require("ufo").peekFoldedLinesUnderCursor)

        -- Option 3: treesitter as a main provider instead
        -- (Note: the `nvim-treesitter` plugin is *not* needed.)
        -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
        -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
        require("ufo").setup(opts)
    end,
    opts = function()
        local ftProvider = {
            r = {"marker", "indent"},
            python = {"treesitter", "indent"},
        }
        return {
            provider_selector = function(bufnr, filetype, buftype)
                return ftProvider[filetype] or { "treesitter", "marker" }
                -- return { "treesitter", "indent" }
            end,
        }
    end,
}
return M
