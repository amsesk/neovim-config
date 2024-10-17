
local set_mark = function(id, path, desc)
    MiniFiles.set_bookmark(id, path, { desc = desc })
end

vim.api.nvim_create_autocmd('User', {
pattern = 'MiniFilesExplorerOpen',
callback = function()
  set_mark('p', os.getenv("HOME") .. "/dev/pmbi/src/pmbi", "PMBI package")
  set_mark('w', vim.fn.getcwd, 'Working directory')
  set_mark('o',os.getenv("HOME") .. "/dev/neorg-work", "PMBI package")
end,
})
