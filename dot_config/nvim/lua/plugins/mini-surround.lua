return {
  "nvim-mini/mini.surround",
  version = "*",
  config = function()
    require("mini.surround").setup({
      search_method = "cover_or_nearest",
      mappings = {
        add = "msa", -- Add surrounding in Normal and Visual modes
        delete = "msd", -- Delete surrounding
        find = "msf", -- Find surrounding (to the right)
        find_left = "msF", -- Find surrounding (to the left)
        highlight = "msh", -- Highlight surrounding
        replace = "msr", -- Replace surrounding
        update_n_lines = "msn", -- Update `n_lines`
      },
    })
  end,
}
