return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("marks").setup({
      cyclic = true,
      bookmark_0 = {
        sign = "⚑",
        -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
        -- defaults to false.
        annotate = false,
      },
    })
  end
}
