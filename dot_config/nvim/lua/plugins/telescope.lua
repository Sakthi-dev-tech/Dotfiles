return {
{
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTelescope", "TodoQuickFix", "TodoLocList" },
    keys = {
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search Todos" },
    },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            n = {
              ["l"] = actions.select_default,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>gC", builtin.git_commits, { desc = "Git commits" })
    end,
  },
}
