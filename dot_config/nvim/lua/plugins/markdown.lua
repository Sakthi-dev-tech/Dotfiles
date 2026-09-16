return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*", -- use latest release, remove to use latest commit
        ---@module 'obsidian'
        ---@type obsidian.config
        opts = {
            legacy_commands = false,
           workspaces = {
                {
                    name = "Obsidian Vault",
                    path = "/home/sakthi/Documents/Obsidian Vault",
                },
            },
            picker = {
                name = "telescope.nvim",
            },
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            default = {
                dir_path = "./Attachments",

                use_absolute_path = false,
            }
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    }
}
