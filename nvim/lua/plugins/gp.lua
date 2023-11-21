K = {
	"robitx/gp.nvim",
        opts = {
            openai_api_key = "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",
            chat_model = "gpt-3.5-turbo",

        },
	config = function(_, opts)
		require("gp").setup(opts)

		-- or setup with your own config (see Install > Configuration in Readme)
		-- require("gp").setup(conf)

        	-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
	end,
}
return K
