return {
    name = "git-blind-commit-push",
    builder = function(params)
        return {
            name = "git-blind-commit-push",
            strategy = {
                "orchestrator",
                tasks = {
                    {
                        "shell",
                        name = "commit",
                        cmd = "git commit -am blind_overseer_commit",
                        -- strategy ={ "toggleterm", direction = "horizontal"},

                    },
                    {
                        "shell",
                        name = "push",
                        cmd = "git push origin",
                        -- strategy ={ "toggleterm", direction = "horizontal"},
                    }
                },
            }
        }
    end,
}
