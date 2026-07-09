return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Typescript LSP
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("ts_ls")

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities
      })
      vim.lsp.enable("rust_analyzer")

      vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

          vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, { desc = "Previous diagnostic" })

          vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, { desc = "Next diagnostic" })

          vim.keymap.set("n", "]e", function()
            vim.diagnostic.jump({
              count = 1,
              float = true,
              severity = vim.diagnostic.severity.ERROR,
            })
          end, { desc = "Next error" })

          vim.keymap.set("n", "[e", function()
            vim.diagnostic.jump({
              count = -1,
              float = true,
              severity = vim.diagnostic.severity.ERROR,
            })
          end, { desc = "Previous error" })

          vim.keymap.set("n", "]w", function()
            vim.diagnostic.jump({
              count = 1,
              float = true,
              severity = vim.diagnostic.severity.WARN,
            })
          end, { desc = "Next warning" })

          vim.keymap.set("n", "[w", function()
            vim.diagnostic.jump({
              count = -1,
              float = true,
              severity = vim.diagnostic.severity.WARN,
            })
          end, { desc = "Previous warning" })
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
        end,
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
      automatic_install = true,
      automatic_enable = true,
    },
  },
}
