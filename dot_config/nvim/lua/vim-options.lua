-- Set <leader>
vim.g.mapleader = " "

-- Vim options
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
<<<<<<< HEAD
=======

-- Keep indentation consistent even when a filetype plugin changes its defaults.
vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
    group = vim.api.nvim_create_augroup("FourSpaceIndent", { clear = true }),
    callback = function()
        vim.bo.expandtab = true
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
    end,
})
>>>>>>> 2be039b (Add mini.ai nvim)
vim.opt.number = true

-- Line number options
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0AF68", bold = true }) -- Set current line number highlight

vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.o.laststatus = 3

-- Custom keymaps
vim.keymap.set({ "i", "s" }, "jj", "<Esc>")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
-- Move between buffers
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('t', "jj", [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
