vim.api.nvim_set_var("mapleader", " ")

-- vim.keymap.set("n", "<leader>q", "q", {noremap = false})
-- vim.keymap.set("n", "q", "<NOP>")

require("config.keymaps")
require("config.lazy")
require("config.settings")
require("config.filetypes")
-- require("snippets.python")
require("autocommands.mini")
require("autocommands.redirect")

vim.g.sonokai_enable_italic = true
vim.g.sonokai_style = "andromeda"
local ok, _ = pcall(vim.cmd.colorscheme, "sonokai")

vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { link = "Normal" })
