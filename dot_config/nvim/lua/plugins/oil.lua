return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = {
        { "nvim-mini/mini.icons", opts = {} },
        "refractalize/oil-git-status.nvim",
    },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
        require("oil").setup({
            win_options = {
                signcolumn = "yes:2",
            },
            keymaps = {
                ["-"] = { "actions.parent", mode = "n" },
                ["."] = { "actions.toggle_hidden", mode = "n" },
            }
        })
        require("oil-git-status").setup()
        vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {desc = "Open parent directory"})
    end
}
