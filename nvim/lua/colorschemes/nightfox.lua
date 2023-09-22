require("nightfox").setup({
  palettes = {
    -- Custom duskfox with black background
    nordfox = {
    },
  },
  specs = {
    all = {
      inactive = "bg0", -- Default value for other styles
    },
    nordfox = {
        syntax = {
            keyword = "red.bright",
            builtin0 = "red.bright",
            builtin1 = "blue.bright",
            func = "magenta.bright",
            field = "blue.bright",
            ident = "white",
            string = "yellow.bright",
            comment = "white.dim",
            conditional = "orange.bright",
            number = "magenta.bright",
        },
    },
  },
  groups = {
    all = {
      NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
    },
  },
})
