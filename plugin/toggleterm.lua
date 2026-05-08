vim.pack.add({
    gh("akinsho/toggleterm.nvim"),
    gh("GCBallesteros/NotebookNavigator.nvim"),
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
local nn = require("notebook-navigator")

local active_term = 1

vim.keymap.set("n", "<leader>tsa", function()
    local i = tonumber(vim.fn.input("Set active terminal to: "))
    active_term= i or active_term
end)

vim.keymap.set("n", "<leader>tga", function()
    print("Active: " .. vim.inspect(active_term))
end)

vim.keymap.set("n", "<leader>tn", function() Terminal:new():open() end)
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>TermSelect<cr>")
vim.keymap.set("n", "<leader>tl", function() ToggleTerm.send_lines_to_terminal("single_line", false, { args = active_term}) end)
vim.keymap.set("v", "<leader>tl", function() ToggleTerm.send_lines_to_terminal("visual_selection", false, { args = active_term}) end)
vim.keymap.set("n", "<leader>tc", function() 
    nn.run_and_move({id=active_term, trim_spaces=false})
end)

