return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Define custom highlight groups
        vim.api.nvim_set_hl(0, "DapBreakpointText", { fg = "#00FF00", bold = true }) -- Green for the dot
        vim.api.nvim_set_hl(0, "DapBreakpointLine", { bg = "#3B4252" })          -- Dim background for the line
        vim.api.nvim_set_hl(0, "DapBreakpointNum", { fg = "#00FF00", bold = true }) -- Green for the line number

        -- Define custom sign for breakpoints with highlight groups
        vim.fn.sign_define('DapBreakpoint', {
            text = '●',
            texthl = 'DapBreakpointText',
            linehl = 'DapBreakpointLine',
            numhl = 'DapBreakpointNum'
        })

        -- DAP configuration for Python
        vim.g.dap_open_Float = false

        dap.adapters.python = {
            type = 'executable',
            command = '/home/franky/Desktop/Workspaces/12.0/virtual-environments/venv/bin/python3.8',
            args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = 'Odoo 12',
                program = '/home/franky/Desktop/Workspaces/12.0/odoo/odoo-bin',
                pythonPath = '/home/franky/Desktop/Workspaces/12.0/virtual-environments/myEnv/bin/python3.7',
                args = {
                    '--config=/home/franky/Desktop/Workspaces/12.0/conf/odoo.conf',
                    '--limit-time-real=10000000',
                    -- '--test-enable',
                },
                cwd = '/home/franky/Desktop/Workspaces/12.0/odoo',
                console = 'internalConsole',
            },
            {
                type = 'python',
                request = 'launch',
                name = 'Odoo 14',
                program = '/home/franky/Desktop/Workspaces/14.0/odoo/odoo-bin',
                pythonPath = '/home/franky/Desktop/Workspaces/14.0/virtual-environments/venv/bin/python3.8',
                args = {
                    '--config=/home/franky/Desktop/Workspaces/14.0/conf/odoo.conf',
                    '--limit-time-real=10000000',
                    -- '--test-enable',
                },
                cwd = '/home/franky/Desktop/Workspaces/14.0/odoo',
                console = 'internalConsole',
            }
        }

        dap.set_log_level('DEBUG')

        -- DAP UI Setup
        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            select_window = function()
                return 1
            end,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
            layouts = {
                {
                    elements = {
                        { id = "stacks", size = 0.15 },
                        { id = "scopes", size = 0.15 },
                        { id = "repl",   size = 0.7 },
                    },
                    position = "bottom",
                    size = 10,
                }
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {
                indent = 1,
                max_value_lines = 100,
            }
        })

        -- Open/close DAP UI on debugging events
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Runner functions
        local arg_database = ''
        local arg_update = ''

        function _G.Runner()
            if dap.session() ~= nil then
                dap.continue()
            else
                vim.ui.select(
                    { 'odoo' },
                    { prompt = "What to run?", format_item = function(runner) return runner end },
                    function(runner)
                        _G.runRunner(runner)
                    end
                )
            end
        end

        function _G.runRunner(runner)
            if runner == 'odoo' then
                _G.OdooRunner()
            else
                error("Runner not available yet: " .. runner)
            end
        end

        function _G.OdooRunner()
            local configs = dap.configurations.python
            local database = vim.fn.input("Database: ", '')
            local update = vim.fn.input("Modules: ", 'all')

            arg_database = "--db-filter=" .. database
            arg_update = "--update=" .. update

            vim.ui.select(
                configs,
                {
                    prompt = "Select config to run: ",
                    format_item = function(config) return config.name end
                },
                function(config)
                    local copy_args = vim.deepcopy(config.args)
                    table.insert(copy_args, arg_database)
                    table.insert(copy_args, arg_update)
                    config.args = copy_args
                    dap.adapters.python.command = config.pythonPath
                    print("Using database: " .. arg_database)
                    print("Using updates: " .. arg_update)
                    dap.run(config)
                end
            )
        end

        function _G.Conditional()
            local condition = vim.fn.input("Condition: ", "")
            dap.toggle_breakpoint(condition)
        end

        -- Key Mappings
        vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<F5>', dap.continue, {})
        vim.keymap.set('n', '<F10>', dap.step_over, {})
        vim.keymap.set('n', '<F11>', dap.step_into, {})
        vim.keymap.set('n', '<Leader>r', _G.Runner, {})
        vim.keymap.set('n', '<Leader>c', _G.Conditional, {})
    end,
}
