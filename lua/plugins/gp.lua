K = {
	"robitx/gp.nvim",
        opts = {
            openai_api_key = os.getenv("OPENAI_API_KEY"),
            agents = {
                { name = "ChatGPT4" },
            },

        },
	config = function(_, opts)
		require("gp").setup(opts)

		-- or setup with your own config (see Install > Configuration in Readme)
		-- require("gp").setup(conf)

        	-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
	end,
}
return {}
