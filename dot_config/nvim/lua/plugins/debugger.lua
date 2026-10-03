return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "mfussenegger/nvim-jdtls",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    init = function()
        local jars = vim.fn.glob(
            vim.fn.stdpath("data")
                .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
            false,
            true
        )
        vim.lsp.config("jdtls", { init_options = { bundles = jars } })
    end,

    config = function()
        local dap = require("dap")
        local ui = require("dapui")
        require("jdtls").setup_dap()
        ui.setup()

        dap.listeners.before.launch.dapui = function()
            ui.open()
        end
        dap.listeners.before.attach.dapui = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui = function()
            ui.close()
        end

        -- keymappings
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debugger Continue" })
        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Step Into" })
    end,
}
