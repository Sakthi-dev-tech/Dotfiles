local function evaluate_percent_cell()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local first, last = 1, #lines
    local header

    local function is_marker(line)
        return line:match("^%s*#%s*%%%%") ~= nil
    end

    -- A marker on the cursor's line belongs to the cell below it.
    for row = cursor[1], 1, -1 do
        if is_marker(lines[row]) then
            first = row + 1
            header = lines[row]
            break
        end
    end
    for row = cursor[1] + 1, #lines do
        if is_marker(lines[row]) then
            last = row - 1
            break
        end
    end

    if header and header:match("%[markdown%]") then
        vim.notify("This is a Markdown cell", vim.log.levels.INFO)
        return
    end

    -- Exclude blank edges, including empty cells between adjacent markers.
    while first <= last and lines[first]:match("^%s*$") do
        first = first + 1
    end
    while last >= first and lines[last]:match("^%s*$") do
        last = last - 1
    end
    if first > last then
        vim.notify("This cell is empty", vim.log.levels.INFO)
        return
    end

    vim.api.nvim_win_set_cursor(0, { first, 0 })
    vim.cmd("normal! V")
    vim.api.nvim_win_set_cursor(0, { last, 0 })
    -- Leaving Visual mode sets the '< and '> marks used by Molten.
    vim.cmd.normal({ args = { vim.api.nvim_replace_termcodes("<Esc>", true, false, true) }, bang = true })
    vim.api.nvim_win_set_cursor(0, cursor)
    vim.cmd("MoltenEvaluateVisual")
end

return {
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        opts = { style = "percent" },
    },
    {
        "benlubas/molten-nvim",
        version = "<2.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 40

            vim.keymap.set("n", "<leader>ji", ":MoltenInit<CR>")
            vim.keymap.set("v", "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>")
            vim.keymap.set(
                "n",
                "<leader>jc",
                evaluate_percent_cell,
                { silent = true, desc = "Run current code cell" }
            )
            vim.keymap.set("n", "<leader>jh", ":MoltenHideOutput<CR>", {desc = "Hide Molten Output"})
            vim.keymap.set("n", "<leader>js", ":MoltenShowOutput<CR>", {desc = "Show Molten Output"})
        end,
    },
}
