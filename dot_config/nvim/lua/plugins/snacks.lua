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
                math = {
                    enabled = false,
                },
                resolve = function(path, src)
                    local api = require("obsidian.api")
                    if api.path_is_note(path) and not src:find("/", 1, true) then
                        local attachment = api.resolve_attachment_path(src)
                        if vim.fn.filereadable(attachment) == 1 then
                            return attachment
                        end
                    end
                end,
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
