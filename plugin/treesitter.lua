vim.pack.add({
	"https://www.github.com/nvim-treesitter/nvim-treesitter",
})

local langs = { "markdown", "markdown_inline", "r", "rnoweb", "yaml", "latex", "csv", "python", "lua", "snakemake" }
require("nvim-treesitter").install(langs)

vim.api.nvim_create_autocmd("FileType", {
    pattern = langs,
    callback = function() 
        vim.treesitter.start()
    end,
})

