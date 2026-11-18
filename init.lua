vim.api.nvim_set_var("mapleader", " ")
vim.api.nvim_set_var("maplocalleader", ",")

-- generic keymaps
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- vim.keymap.set("n", "<leader>R", "<cmd>restart<cr>")

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

local vscode = require("vscode")
-- vim.keymap.set("n", "<leader>ga", "<cmd>lua require('vscode').action('editor.action.formatDocument')<cr>")
vim.keymap.set("n", "<leader>gf", function() vscode.action("editor.action.formatDocument") end)
vim.keymap.set({"n", "x"}, "<leader>tl", function() vscode.action("workbench.action.positronConsole.executeCode") end)
vim.keymap.set("n", "<leader>ts", function() vscode.action("positronNotebook.cell.executeSelection") end)
vim.keymap.set("n", "<leader>tc", function() vscode.action("positron.runCurrentAdvance") end)

vim.keymap.set("n", "<leader>zR", function() vscode.action("editor.foldAll") end)
vim.keymap.set("n", "<leader>za", function() vscode.action("editor.toggleFold") end)
vim.keymap.set("n", "<leader>zC", function() vscode.action("editor.foldRecursively") end)
vim.keymap.set("n", "<leader>zO", function() vscode.action("editor.unfoldRecursively") end)

-- vim.keymap.set("n", "<leader>ta", function() vscode.action("notebook.cell.executeAndSelectBelow") end)
-- vim.keymap.set("n", "<leader>tb", function() vscode.action("interactive.execute") end)
-- vim.keymap.set("n", "<leader>tc", function() vscode.action("workbench.action.positronConsole.findNext.fromInput") end)


if vim.g.vscode then
  -- Workaround for vscode-neovim UI desync (issue #2117)

  -- 1. Redraw on CursorHold (idle for some time)
  local redraw_fix = vim.api.nvim_create_augroup('VSCodeRedrawFix', { clear = true })
  vim.api.nvim_create_autocmd('CursorHold', {
    group = redraw_fix,
    callback = function()
      vim.cmd('silent! mode')  -- triggers a lightweight redraw
    end,
  })

  -- 2. Redraw immediately after text changes (e.g., visual delete)
  local redraw_group = vim.api.nvim_create_augroup('RedrawOnDelete', { clear = true })
  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    group = redraw_group,
    callback = function()
      if vim.fn.mode() == 'n' then
        vim.cmd('silent! mode')  -- refresh UI after delete/insert
      end
    end,
  })
end

-- vim.o settings
-- vim.o.number = true
-- vim.o.relativenumber = true
-- vim.o.softtabstop = 4
-- vim.o.expandtab = true
-- vim.o.shiftwidth = 4
-- vim.o.smartindent = true
-- vim.o.cursorline = true
-- vim.o.cursorcolumn = false
-- vim.o.termguicolors = true
-- vim.o.scrolloff = 8
-- vim.o.wrap = true

-- switch between relative and absolute line numbers
-- local numbering = "rel"
-- vim.keymap.set("n", "<leader>nn", function()
--     if numbering == "abs" then
--         vim.o.number = false
--         vim.o.relativenumber = true
--         numbering = "rel"
--     else
--         vim.o.relativenumber = false
--         vim.o.number = true
--         numbering = "abs"
--     end
-- end)
