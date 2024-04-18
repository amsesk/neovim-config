vim.o.number = false
vim.o.relativenumber = true
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.termguicolors = true
vim.o.scrolloff = 8

--vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldcolumn = "auto:9"
--vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
--vim.o.foldlevelstart = 99
vim.wo.foldmethod="expr"
vim.o.foldexpr="nvim_treesitter#foldexpr()"
vim.o.foldenable = true

vim.o.guicursor = "n:blinkon0,i:blinkon1"
