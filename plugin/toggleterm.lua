vim.pack.add({
    "https://www.github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({
    size=20,
    open_mapping=nil,
    direction="horizontal",
    start_in_insert=false,
    persist_mode=false,
    close_on_exit=true,
    insert_mappings=false,
    winbar = {
        enabled=true
    },
})

local Terminal = require("toggleterm.terminal").Terminal
local ToggleTerm = require("toggleterm")

local active_repl = 1

vim.keymap.set("n", "<leader>tsa", function()
    local i = tonumber(vim.fn.getcharstr())
    active_repl=i
end)

vim.keymap.set("n", "<leader>tpa", function()
    print("Active: " .. vim.inspect(active_repl))
end)

vim.keymap.set("n", "<leader>tn", function() Terminal:new():open() end)
vim.keymap.set("n", "<leader>ll", function() ToggleTerm.send_lines_to_terminal("single_line", false, { args = active_repl }) end)
