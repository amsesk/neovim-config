vim.pack.add({
    "http://www.github.com/kevinhwang91/nvim-ufo",
    "http://www.github.com/kevinhwang91/promise-async",
})


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
end

-- require("promise-async")
require("ufo").setup(opts())

vim.o.foldcolumn = "auto:9"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zP", require("ufo").peekFoldedLinesUnderCursor)
