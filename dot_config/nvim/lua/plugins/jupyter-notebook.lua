return {
    {
        "GCBallesteros/jupytext.nvim",
        config = function ()
            require("jupytext").setup({
            })
        end,
        -- Depending on your nvim distro or config you may need to make the loading not lazy
        -- lazy=false,
    },
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.keymap.set("x", "<leader>jr", ":<C-u>MoltenEvaluateVisual<CR>", {
                desc = "Run selected code",
            })
        end,
    },
}
