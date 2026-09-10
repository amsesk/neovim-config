vim.api.nvim_set_var("mapleader", " ")
vim.api.nvim_set_var("maplocalleader", ",")

-- generic keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>r", "<cmd>restart<cr>")

--filetypes
-- vim.filetype.add({
--     pattern = { [".*[.]tmpl$"] = "template" },
-- })

-- vim.pack helper functions
gh = function(repo) 
	return "http://www.github.com/" .. repo .. ".git" 
end

cb = function(repo) 
	return "http://www.codeberg.org/" .. repo .. ".git"
end

-- everforest presets
vim.g.everforest_background = "medium"

-- vim.o settings
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
vim.o.wrap = true

-- load lsp files
local lsp_path = vim.fn.stdpath("config") .. "/lua/lsp"
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
    if file:match("%.lua$") then
        local module_name = "lsp." .. file:gsub("%.lua", "")
        require(module_name)
    end
end

-- switch between relative and absolute line numbers
local numbering = "rel"
vim.keymap.set("n", "<leader>nn", function()
    if numbering == "abs" then
        vim.o.number = false
        vim.o.relativenumber = true
        numbering = "rel"
    else
        vim.o.relativenumber = false
        vim.o.number = true
        numbering = "abs"
    end
end)
