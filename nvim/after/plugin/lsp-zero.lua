local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Primeagen apparently outdated keybinding config
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
--    ["<C-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
--    ["<CR>"] = cmp.mapping.confirm({select=true}),
--    ["<C-Space>"] = cmp.mapping.complete(),
--})    

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {"r_language_server", "pyright", "bashls", "lua_ls", "rust_analyzer"},
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping.select_next_item({behavior = "select"}),
      ["<C-Tab>"] = cmp.mapping.select_prev_item({behavior = "select"}),
      ['<CR>'] = cmp.mapping.confirm({select = true}),
  })
})
