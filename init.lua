vim.api.nvim_set_var("mapleader", " ")

require("config.keymaps")
require("config.lazy")
require("config.settings")
require("config.filetypes")
-- require("snippets.python")
require("autocommands.mini")

local ok, _ = pcall(vim.cmd.colorscheme, "rose-pine")

vim.api.nvim_set_hl(0, "NormalFloat", {link="Normal"})
vim.api.nvim_set_hl(0, "FloatBorder", {link="Normal"})
vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", {link="Normal"})
vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", {link="Normal"})
vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", {link="Normal"})
