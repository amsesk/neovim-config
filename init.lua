vim.api.nvim_set_var("maplocalleader", "'")
vim.api.nvim_set_var("mapleader", " ")

require("config.lazy")
require("config.keymaps")
require("config.settings")
require("config.filetypes")
require("snippets.python")

if vim.bo.filetype == "r" then
    local ok, _ = pcall(vim.cmd.colorscheme, "tokyonight-moon")
else
    local ok, _ = pcall(vim.cmd.colorscheme, "kanagawa-wave")
end
