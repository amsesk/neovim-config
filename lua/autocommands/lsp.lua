
vim.api.nvim_create_autocmd("LspRequest", {
    callback = function(args)
        -- print(vim.inspect(args))
    end,
})
