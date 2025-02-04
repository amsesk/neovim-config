local function zuzu_opts()
    return {
        build_count = 4,
        display_strategy_count = 4,
        display_strategies = {
            require("zuzu.display_strategies").split_below,
            require("zuzu.display_strategies").split_below,
            require("zuzu.display_strategies").split_below,
            require("zuzu.display_strategies").split_below,
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
return K
