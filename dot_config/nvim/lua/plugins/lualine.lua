return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return " " .. str
                        end,
                    },
                },

                lualine_c = {
                    { "filename", path = 1 },
                },
            },
            option = {
                theme = "dracula",
                globalstatus = true,
            },
        })
    end,
}
