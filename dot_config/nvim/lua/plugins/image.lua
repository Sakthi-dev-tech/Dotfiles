return {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
        backend = "kitty", -- Also supported by Ghostty.
        processor = "magick_cli",
        max_width = 160,
        max_height = 40,
        scale_factor = 1.5,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
    }
}
