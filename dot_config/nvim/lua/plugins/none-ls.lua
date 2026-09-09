return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim"
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        }),
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--no-use-tabs", "--tab-width", "4" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        require("none-ls.diagnostics.eslint"),
      },
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format file" })
  end,
}
