local R_executable = os.getenv("R_PATH") or "R"
vim.lsp.config("r_language_server", {
    cmd = { R_executable, '--no-echo', '-e', 'languageserver::run()' },
    settings = {
        flags = {
            debounce_text_changes = 150,
        },
    },
})

vim.lsp.enable("r_language_server")
vim.diagnostic.config({underline=false})
