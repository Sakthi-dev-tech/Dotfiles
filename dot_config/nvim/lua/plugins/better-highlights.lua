return {
  "machakann/vim-highlightedyank",
  event = "TextYankPost",
  config = function()
    -- Optional: Adjust how long the highlight lasts (in milliseconds)
    vim.g.highlightedyank_highlight_duration = 150
  end
}
