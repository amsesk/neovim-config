K = { 
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
        highlight_groups = {
            FlashBackdrop = { fg = "Muted" },
            FlashCursor = { fg = "Love", bg = "Base" },
            Search = { fg = "Iris", bg = "Base" },
            CurSearch = { fg = "Iris", bg = "Overlay" },
            FlashLabel = { fg = "Love", bg = "Overlay" },
            FlashCharSearch = { fg = "Love", bg = "Base" }, -- f,F,t,T elswhere
            Visual = {bg = "Muted" }
        },
    }
}
return K
