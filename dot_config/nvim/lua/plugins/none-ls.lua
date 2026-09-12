return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim"
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

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
        formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        }),
        formatting.prettier.with({
          extra_args = { "--tab-width", "4", "--no-use-tabs" },
        }),
        formatting.black,
        formatting.isort.with({
          extra_args = { "--indent", "    " },
        }),
        formatting.clang_format.with({
          extra_args = {
            "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
          },
        }),

        require("none-ls.diagnostics.eslint"),
      },
    })

    vim.keymap.set("n", "<leader>ff", function()
      local has_none_ls_formatter = require("null-ls.generators").can_run(
        vim.bo.filetype,
        null_ls.methods.FORMATTING
      )

      vim.lsp.buf.format({
        filter = has_none_ls_formatter and function(client)
          return client.name == "null-ls"
        end or nil,
      })
    end, { desc = "Format file" })
  end,
}
