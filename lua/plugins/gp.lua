K = {
    "robitx/gp.nvim",
    opts = {
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        agents = {},
        chat_user_prefix = ">>",
        hooks = {
            Document = function(gp, params)
                local template = "I have the following function defintion in {{filename}}:\n\n"
                    .. "```{{filetype}}\n{{selection}}\n```\n\n"
                    .. "Please write a {{filetype}} docstring for it."
                local agent = gp.get_command_agent()
                gp.Prompt(params, gp.Target.rewrite, nil, agent.model, template, agent.system_prompt)
            end,
        },
    },
    config = function(_, opts)
        require("gp").setup(opts)
        vim.cmd("GpAgent CodeGPT4o")
    end,
    lazy = false,
    keys = {
        {"<C-g>D", ":GpDocument", mode = "v", desc = "Generate docstring for function signature defined in visual selection."},
        {"<C-g>t", ":GpChatToggle popup<cr>", mode = "n", desc = "Toggle the chat window."},

    }
}
return K
