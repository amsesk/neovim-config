local bookmarks = {
    {
        id = "p",
        path = os.getenv("HOME") .. "/dev/pmbi/src/pmbi",
    },
    {
        id = "g",
        path = os.getenv("HOME") .. "/dev/geomx",
    },
    {
        id = "t",
        path = os.getenv("HOME") .. "/super2/tcsl",
    },
    {
        id = "b",
        path = os.getenv("HOME") .. "/super1/tcsl/breastvax_human",
    },
}

-- require("mini.files").set_bookmark(
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesExplorerOpen",
    callback = function()
        for _i, bm in ipairs(bookmarks) do
            if vim.fn.isdirectory(bm.path) == 1 then
                MiniFiles.set_bookmark(bm.id, bm.path)
            end
        end
    end,
})

