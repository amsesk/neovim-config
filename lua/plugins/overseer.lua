K = {
  'stevearc/overseer.nvim',
  dependencies = {
      "stevearc/dressing.nvim",
      "ibhagwan/fzf-lua",
  },
  opts = {
      templates = {"builtin", "user.btm", "user.blind_commit_push"},
      task_list = {
          default_detail = 3,
          max_height = {60, 0.2},
          min_height = 40,
      },
  },
  keys = {
      { "<leader>oo", "<cmd>OverseerToggle<cr>", "Open overseen task list" },
      { "<leader>or", "<cmd>OverseerRun<cr>", "Run an overseer task" },
      { "<leader>ota", "<cmd>OverseerTaskAction<cr>", "Run a task action" },

  }
}
return K
