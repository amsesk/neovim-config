vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf.tmpl"] = "hyprlang" },
})
