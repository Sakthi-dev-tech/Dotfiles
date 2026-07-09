return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git add all" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit (Fugitive)" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git Push" })

      vim.keymap.set("n", "<leader>gvd", ":Gvdiffsplit<CR><C-w>x", { desc = "Git Vertical Diff" })
    end,
  },
}
