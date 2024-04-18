K = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts) require'lsp_signature'.setup(opts) end,
  keys = {
      {"<C-k>", "<cmd>lua require('lsp_signature').toggle_float_win()<CR>",  "Toggle floating window", mode = {"n", "i"}}
  }
}
return K
