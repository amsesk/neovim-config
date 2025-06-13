local function zuzu_opts()
    local floating_toggle_term = function(cmd)
        vim.cmd("TermExec cmd='" .. cmd .. "' direction=float name='zuzu float'")
    end
    return {
        build_count = 4,
        display_strategy_count = 4,
        display_strategies = {
		floating_toggle_term,
		require("zuzu.display_strategies").split_terminal("horizontal rightbelow", true),
		require("zuzu.display_strategies").background,
		require("zuzu.display_strategies").command,
	},
   }
   end
K = {
   "gitpushjoe/zuzu.nvim",
   config = function(_, opts)
       require("zuzu").setup(zuzu_opts())
   end,
   lazy=false,
}
return {}
-- return K
