-- Tokyonight
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "dark",
      },
      on_highlights = function(hl, c)
        hl.NormalFloat = { bg = c.bg_dark }
        hl.FloatBorder = { fg = c.blue, bg = c.bg_dark }
        hl.Pmenu = { bg = c.bg_dark, fg = c.fg }
        hl.PmenuSel = { bg = c.bg_highlight, fg = c.fg }
        hl.CmpPmenu = { bg = c.bg_dark, fg = c.fg }
        hl.CmpBorder = { fg = c.blue, bg = c.bg_dark }
      end,
    })
    vim.opt.termguicolors = true
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}
