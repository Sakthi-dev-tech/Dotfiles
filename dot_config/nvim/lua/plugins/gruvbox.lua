return {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
        vim.cmd("colorscheme gruvbox-medium")

        require("gruvbox").setup({
            variant = "hard",
            dark_variant = "hard",

            enable = {
                terminal = true,
                migrations = true, -- Handle deprecated options automatically
                devicons = true, -- Theming devicons with gruvbox
                lualine = true,
            },
        })
    end,
}
