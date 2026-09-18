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
