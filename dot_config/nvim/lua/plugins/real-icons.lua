return {
    "Mirsmog/real-icons.nvim",
    build = ":RealIcons install",
    opts = {
        integrations = {
            oil = true,
            lualine = true,
            bufferline = true,
            telescope = true,
        },
    },
}
