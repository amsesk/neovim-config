vim.api.nvim_set_var('maplocalleader', "'")
vim.api.nvim_set_var('mapleader', " ")

require("config.lazy")
require("config.keymaps")
require("config.settings")
require("snippets.python")

local ok, _ = pcall(vim.cmd.colorscheme, 'rose-pine-moon')
