return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = {
            { "nvim-mini/mini.icons", opts = {} },
        },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function()
            require("oil").setup({
                win_options = {
                    signcolumn = "yes:2"
                },
                keymaps = {
                    ["h"] = { "actions.parent", mode = "n" },
                    ["."] = { "actions.toggle_hidden", mode = "n" },
                    ["l"] = { "actions.select" }
                }
            })
            vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
        end
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {}
    },
    {
        "refractalize/oil-git-status.nvim",

        dependencies = {
            "stevearc/oil.nvim",
        },

        config = true,
    },
}
