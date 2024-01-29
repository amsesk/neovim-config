K = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts) require'lsp_signature'.setup(opts) end,
  keys = {
      {"<leader>kk", "<cmd>lua require('lsp_signature').toggle_float_win()<CR>",  "Toggle floating window"}
  }
}
return K

