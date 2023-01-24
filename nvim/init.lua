-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Functional wrapper for mapping custom keybindings
-- (from https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2)
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })

-- Set line numbers
vim.o.number = true

-- make tabs shorter and use spaces
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4

-- set termguicolors to enable highlight groups
vim.o.termguicolors = true

require('plugins')

-- empty setup using defaults
require("nvim-tree").setup {
	open_on_setup_file = true,
}

require('nvim-web-devicons').setup()

require('lualine').setup {
	options = {
		theme = 'codedark',
	}
}	
