return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-mini/mini.icons",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    preset = "helix",
    notify = true,
    icons = {
      breadcrumb = "»", -- symbol used in the command line area
      separator = "➜", -- symbol used between key and command
      group = "+", -- symbol prepended to a group of keymaps
      ellipsis = "...",
    },
    show_keys = true,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      { "<leader>g", group = "Goto" },
      { "<leader>s", group = "Telescope" },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Format" },
      { "<leader>b", group = "Buffer" },
      { "<leader>o", group = "Opencode"}
    })
  end,
}
