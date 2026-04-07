vim.pack.add({
    {
        src = "http://www.github.com/saghen/blink.cmp",
        version = "v1",
    },
    {
        src = "http://www.github.com/neovim/nvim-lspconfig",
    },
})

---@module 'blink.cmp'
---@type blink.cmp.Config
local blink_opts = {
    keymap = {
        preset = "none",
        ["<C-p>"] = false,
        ["<C-n>"] = false,
        ["<C-y>"] = { "accept" },
        ["<C-e>"] = { "select_prev" },
        ["<C-n>"] = { "select_next" },
        ["<C-g>"] = { "show_signature", "hide_signature", "fallback" },
        ["<C-u>"] = { "scroll_signature_up", "fallback" },
        ["<C-d>"] = { "scroll_signature_down", "fallback" },
        ["<C-space>"] = { "show", "hide" },
    },
    signature = {
        enabled = true,
        window = {
            show_documentation = true,
            max_height=20,
            border="bold",
        },
    },
    appearance = {
        nerd_font_variant = "mono",
        -- use_nvim_cmp_as_default = true,
    },
    sources = {
        default = {
            "lsp",
            "path",
            "buffer",
        },
    },
}

require("blink.cmp").setup(blink_opts)
local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- vim.api.nvim_create_autocmd("LspAttach", {
-- group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- callback = function(ev)

-- Buffer local mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions

-- just commented
--
-- Enable completion triggered by <c-x><c-o>
-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

-- Explicitly disable virtual text diagnostics
-- vim.diagnostic.config({ virtual_text = false })
--
-- local opts = { buffer = ev.buf }
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- -----

--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
-- vim.keymap.set("n", "<space>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
-- vim.keymap.set("n", "<space>f", function()
--     vim.lsp.buf.format({ async = true })
-- end, opts)
-- end,
-- })
