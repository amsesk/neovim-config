vim.pack.add({
    "http://www.github.com/kevinhwang91/nvim-ufo",
    "http://www.github.com/kevinhwang91/promise-async",
})

require("ufo")


local opts = function()
    local ftProvider = {
        r = {"lsp", "marker"},
        python = {"lsp", "treesitter"},
        lua = {"lsp", "treesitter"},
    }
    return {
        provider_selector = function(bufnr, filetype, buftype)
            return ftProvider[filetype] or { "treesitter", "indent" }
        end,
    }
end

require("ufo").setup(opts())

vim.o.foldcolumn = "auto:9"
vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zP", require("ufo").peekFoldedLinesUnderCursor)
