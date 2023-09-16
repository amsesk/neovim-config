local builtin = require("telescope.builtin")
vim.keymap.set('n', "<leader>pf", builtin.find_files, {})
vim.keymap.set('n', "<C-p>", builtin.git_files, {})
vim.keymap.set('n', "<leader>pg", function()
builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', "<leader>pb", builtin.buffers, {})
vim.keymap.set('n', "<leader>pc", builtin.colorscheme, {})
