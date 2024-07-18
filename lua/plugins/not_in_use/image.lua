K = {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    opts = {
        backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
        max_width = 100, -- tweak to preference
        max_height = 12, -- ^
        max_height_window_percentage = math.huge, -- this is necessary for a good experience
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        integrations = {
            markdown = {
                resolve_image_path = function(document_path, image_path, fallback)
                    -- document_path is the path to the file that contains the image
                    -- image_path is the potentially relative path to the image. for
                    -- markdown it's `![](this text)`

                    -- you can call the fallback function to get the default behavior
                    return fallback(document_path, image_path)
                end,
            },
        },
    },
    config = function(_, opts)
        require("image").setup(opts)
    end,
}
return {}
-- return K
