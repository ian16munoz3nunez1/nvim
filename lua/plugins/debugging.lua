return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "rcarriga/cmp-dap",
        "nvim-neotest/nvim-nio",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
        "suketa/nvim-dap-ruby"
    },

    config = function ()
        local dap, dapui = require("dap"), require("dapui")
        vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='DapBreakpoint', linehl='', numhl=''})
        vim.fn.sign_define('DapStopped', {text='▶', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped'})

        require("dapui").setup()
        require("dap-go").setup()
        require("dap-python").setup("python3")
        require("dap-ruby").setup()

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }
        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                args = {}, -- provide arguments if needed
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
            {
                name = "Select and attach to process",
                type = "gdb",
                request = "attach",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                pid = function()
                    local name = vim.fn.input('Executable name (filter): ')
                    return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = '${workspaceFolder}'
            },
            {
                name = 'Attach to gdbserver :1234',
                type = 'gdb',
                request = 'attach',
                target = 'localhost:1234',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}'
            }
        }
        dap.configurations.cpp = dap.configurations.c

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})
        vim.keymap.set("n", "<leader>duo", dapui.open, {})
    end
}

