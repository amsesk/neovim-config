vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf.tmpl"] = "hyprlang" },
})
vim.filetype.add({
  pattern = { [".*/*/.*%.lua.tmpl"] = "lua" },
})
vim.filetype.add({
  pattern = { [".*/.*%.jsonc.tmpl"] = "jsonc" },
})
vim.filetype.add({
  pattern = { [".*/.*%.css.tmpl"] = "css" },
})
