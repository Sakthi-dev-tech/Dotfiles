return {
    "3rd/image.nvim",
    build = false, -- Use the ImageMagick CLI instead of building the Lua rock.
    config = function(_, opts)
        local image = require("image")

        local function below_reference(options)
            if options and options.namespace and options.with_virtual_padding then
                options = vim.tbl_extend("force", {}, options, { render_offset_top = 1 })
            end
            return options
        end

        -- Document integrations otherwise draw on the reference's own row.
        local from_file = image.from_file
        image.from_file = function(path, options)
            return from_file(path, below_reference(options))
        end

        image.setup(opts)
    end,
    opts = {
        max_width = 160,
        max_height = 40,
        scale_factor = 1.5,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        editor_only_render_when_focused = true,
        tmux_show_only_in_active_window = true,
    },
}
