return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")
    notify.setup({
      timeout = 1500,
      stages = "fade_in_slide_out",
      render = "compact",
      top_down = true,
    })

    vim.notify = notify
  end,
}
