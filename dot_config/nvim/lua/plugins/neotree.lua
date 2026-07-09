return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require("neo-tree").setup({
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false
        },
        window = {
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node"
          }
        }
      }
    })
    -- Keymaps
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {})
  end
}
