vim.pack.add({
    gh("echasnovski/mini.nvim"),
})

require("mini.ai").setup()
require("mini.files").setup({
    mappings = {
        go_in = "<cr>",
        go_out = "-",
        mark_goto = "`",
    },
})
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.surround").setup({
    mappings = {
        add = "ys",
        delete = "ds",
        replace = "cr",
        highlight = "",
        replace = "",
        find = "",
        find_left = "",
    },
})
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
    snippets = {
        gen_loader.from_lang(),
    },
    mappings = {
        expand = "<C-p>",
        jump_next = "<C-e>",
        jump_prev = "<C-n>",
        stop = "<C-c>",
    },
})

-- Keys
vim.keymap.set("n", "<leader>pv", "<cmd>lua MiniFiles.open()<cr>")

-- Bookmarks
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
        MiniFiles.set_bookmark('d', '~/dev', 'dev')
        MiniFiles.set_bookmark('h', '~', 'home')
        MiniFiles.set_bookmark('p', '~/dev/pmbi', 'pmbi')
        MiniFiles.set_bookmark('g', '~/dev/geomx', 'geomx')
        MiniFiles.set_bookmark('1', '~/super1', 'super1')
        MiniFiles.set_bookmark('2', '~/super2', 'super2')
        -- set_mark('w', vim.fn.getcwd, 'Working directory') -- callable
        -- set_mark('~', '~', 'Home directory')
    end,
})
