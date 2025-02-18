K = {
    "robitx/gp.nvim",
    opts = {
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        default_chat_agent = "CodeGPT4o",
        default_command_agent = "CodeGPT4o",
        chat_user_prefix = ">>",
        chat_shortcut_respond = { modes = {"n"}, shortcut = "<C-g><Enter>" },
        hooks = {
            Document = function(gp, params)
                local template = "I have the following function defintion in {{filename}}:\n\n"
                    .. "```{{filetype}}\n{{selection}}\n```\n\n"
                    .. "Please write a {{filetype}} docstring for it."
                local agent = gp.get_command_agent()
                gp.Prompt(params, gp.Target.rewrite, agent, template)
            end,
        },
    },
    config = function(_, opts)
        require("gp").setup(opts)
        -- vim.cmd("GpAgent CodeGPT4o")
    end,
    lazy = false,
    keys = {
        {"<C-g>t", ":GpChatToggle popup<cr>", mode = "n", desc = "Toggle the chat window."},
        {"<C-g>dd", ":GpDocument<cr>", mode = "n", desc = "Write a docstring for the selected function signature."},

    }
}
return K
