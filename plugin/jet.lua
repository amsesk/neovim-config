vim.pack.add({ "https://github.com/wurli/jet.nvim" })
vim.pack.add({ "https://github.com/wurli/jet.ark" })

require("jet").setup({
    binary_path = "/home/amsesk/.local/bin/jet",
    library_path = "/home/amsesk/pkgs/jet_lua-x86_64-unknown-linux-gnu/libjet_lua.so",
})

require("jet.ark").setup({
    ark_binary_path = "/home/amsesk/.local/bin/ark",
})

vim.keymap.set(
    { "n", "x" },
    "go",
    require("jet.api").handle_motion(function(range, filetype)
        require("jet.api").get_kernel({
            filetype = filetype,
            current = true,
            status = { "connected", "connecting" },
        }, function(k)
            local code = range:code({ comments = false })
            if code then
                k:send_repl(code)
            end
        end)
    end),
    { desc = "Execute code (Jet)", expr = true }
)
