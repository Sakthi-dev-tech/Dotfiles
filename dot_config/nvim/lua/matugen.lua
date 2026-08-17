 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0f1417',
    base01 = '#1b2023',
    base02 = '#262b2e',
    base03 = '#8a9297',
    base04 = '#c0c8cd',
    base05 = '#dfe3e7',
    base06 = '#dfe3e7',
    base07 = '#dfe3e7',
    base08 = '#ffb4ab',
    base09 = '#c7c2ea',
    base0A = '#b4cad6',
    base0B = '#8ccff1',
    base0C = '#c7c2ea',
    base0D = '#8ccff1',
    base0E = '#b4cad6',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#dfe3e7',          bg = '#0f1417' })
  hi('TelescopeBorder',         { fg = '#8a9297',             bg = '#0f1417' })
  hi('TelescopePromptNormal',   { fg = '#dfe3e7',          bg = '#0f1417' })
  hi('TelescopePromptBorder',   { fg = '#8a9297',             bg = '#0f1417' })
  hi('TelescopePromptPrefix',   { fg = '#8ccff1',             bg = '#0f1417' })
  hi('TelescopePromptCounter',  { fg = '#c0c8cd',  bg = '#0f1417' })
  hi('TelescopePromptTitle',    { fg = '#0f1417',             bg = '#8ccff1' })
  hi('TelescopePreviewTitle',   { fg = '#0f1417',             bg = '#b4cad6' })
  hi('TelescopeResultsTitle',   { fg = '#0f1417',             bg = '#c7c2ea' })
  hi('TelescopeSelection',      { fg = '#dfe3e7',          bg = '#262b2e' })
  hi('TelescopeSelectionCaret', { fg = '#8ccff1',             bg = '#262b2e' })
  hi('TelescopeMatching',       { fg = '#8ccff1',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
