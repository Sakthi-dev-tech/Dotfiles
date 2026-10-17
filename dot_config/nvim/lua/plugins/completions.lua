return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")
      cmp.setup.cmdline(":", {
        enabled = true,
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Keep nvim-cmp for command-line completion only.
      cmp.setup({ enabled = false })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-y>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
      },
      completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
          auto_show = true,
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
          window = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,EndOfBuffer:CmpPmenu",
          },
        },
        ghost_text = { enabled = true, show_with_menu = true },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      fuzzy = { implementation = "lua" },
      cmdline = { enabled = false },
    },
  },
}
