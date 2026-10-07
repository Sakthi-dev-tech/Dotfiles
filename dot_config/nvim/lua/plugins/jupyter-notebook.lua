return {
    {
        "goerz/jupytext.vim",
        init = function()
            -- Direct Jupytext to use the "percent" format (# %%)
            vim.g.jupytext_fmt = "py:percent"
            -- Prevent automatically running the file on open
            vim.g.jupytext_enable = 1
        end,
    },
}
