vim.pack.add({
    gh("sindrets/diffview.nvim"),
    gh("m00qek/baleia.nvim"),
    gh("barrettruth/diffs.nvim"),
    gh("NeogitOrg/neogit")
})

-- dependencies
require("fzf-lua")
require("diffview").setup()
require("baleia").setup()
require("neogit").setup({})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", {desc = "Start neogit"})

-- gitsigns keymaps
-- vim.keymap.set({"n", "v"}, "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
-- vim.keymap.set({"n", "v"}, "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
-- vim.keymap.set({"n", "v"}, "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })
-- vim.keymap.set({"n", "v"}, "<leader>hv", "<cmd>Gitsigns toggle_linehl<cr>", { desc = "Toggle line highlights." })
-- vim.keymap.set({"n", "v"}, "<leader>hA", "<cmd>Gitsigns attach<cr>", { desc = "Attach gitsigns to the current buffer." })
