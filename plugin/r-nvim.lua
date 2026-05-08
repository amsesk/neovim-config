vim.pack.add({
    gh("R-nvim/R.nvim"),
})

local opts = {
    disable_cmds = {
        "RSummary",
    },
    r_ls = {
        completion = false, -- enable the completion provider
        hover = false, -- enable the hover provider
        signature = false, -- enable the signature help provider
        implementation = false, -- enable the implementation provider
        definition = false, -- enable the definition provider
        use_git_files = false, -- use git to find R files, skipping gitignored files
        references = false, -- enable the references provider
        document_highlight = false, -- enable the document highlight provider
        document_symbol = false, -- enable the document symbol provider
        workspace_symbol = false, -- enable the workspace symbol provider
        rename = false, -- enable the rename provider
        -- doc_width = 0,
        -- fun_data_1 = { "select", "rename", "mutate", "filter" },
        -- fun_data_2 = { ggplot = { "aes" }, with = { "*" } },
        -- fun_data_formula = { ggplot = { "facet_wrap", "facet_grid", "vars" } },
        -- quarto_intel = nil,
    },
}

r_path_in_env = os.getenv("R_PATH")
if r_path_in_env then
    local spl = vim.split(r_path_in_env, "/")
    local R_app = table.remove(spl, #spl)
    local R_path = table.concat(spl, "/")
    opts["R_app"] = R_app
    opts["R_path"] = R_path
end

require("r").setup(opts)
