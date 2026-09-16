return {
    "saghen/blink.indent",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
        require("quicker").setup()
    end,
}
