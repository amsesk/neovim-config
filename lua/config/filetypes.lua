vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
  pattern = { [".*/hypr/.*%.conf.tmpl"] = "hyprlang" },
})
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf.tmpl"] = "hyprlang" },
})
vim.filetype.add({
  pattern = { [".*/.*%.jsonc.tmpl"] = "jsonc" },
})
vim.filetype.add({
  pattern = { [".*/.*%.css.tmpl"] = "css" },
})
