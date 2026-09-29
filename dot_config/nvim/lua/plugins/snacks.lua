return {
    -- lazy.nvim
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            scroll = {
                -- your scroll configuration comes here
                enabled = true,
                animate = {
                    duration = { step = 10, total = 200 },
                    easing = "linear",
                },
            },

            terminal = {
                -- terminal configuration
                win = {
                    style = "terminal",
                    position = "bottom",
                    height = 0.4,
                },
            },

            image = {
                enabled = true,
                doc = {
                    -- This ensures images render inside markdown files automatically
                    inline = true,
                    float = true,
                    max_width = 80,
                    max_height = 40,
                },
            },
        },

        keys = {
            {
                "<leader>t",
                function()
                    Snacks.terminal.toggle()
                end,
                mode = { "n", "t" },
                desc = "Toggle Snacks Terminal",
            },
        },
    },
}
