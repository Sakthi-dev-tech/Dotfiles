return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = {} },
  },
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
        close_command = function(n)
          Snacks.bufdelete(n)
        end,
        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and " " .. diag.error .. " " or "")
            .. (diag.warning and " " .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        indicator = {
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "● ",
        close_icon = " ",
        left_trunc_marker = " ",
        right_trunc_marker = " ",
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        duplicates_across_groups = true,
        move_wraps_at_ends = false,
        separator_style = "thin",
      },
    })

    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Goto left buffer" })
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Goto right buffer" })
    vim.keymap.set("n", "<leader>bd", function()
      Snacks.bufdelete()
    end, { desc = "Delete buffer" })
  end,
}
