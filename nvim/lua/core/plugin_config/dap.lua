local dap = require('dap')
local dapui = require('dapui')

local config = {
    layouts = {
    {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide IDs as strings or tables with "id" and "size" keys
            {
                id = "scopes",
                size = 0.5, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "repl", size=0.25},
            -- { id = "stacks", size = 0.25 },
            -- { id = "watches", size = 0.25 },
        },
        size = 40,
        position = "left", -- Can be "left" or "right"
    },{
        elements = {
            -- "repl",
            "console",
        },
        size = 10,
        position = "bottom", -- Can be "bottom" or "top"
    },
    },
}


dapui.setup(config)

vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>vr', dap.continue)
vim.keymap.set('n', '<leader>vs', dap.step_over)

vim.keymap.set('n', '<leader>vo', dapui.open)
vim.keymap.set('n', '<leader>vc', dapui.close)

-- close nerdtree or taglists
local function close_nvim_ide_panels()
    if pcall(require, 'ide') then
        local ws = require('ide.workspaces.workspace_registry').get_workspace(vim.api.nvim_get_current_tabpage())
        if ws ~= nil then
            ws.close_panel(require('ide.panels.panel').PANEL_POS_BOTTOM)
            ws.close_panel(require('ide.panels.panel').PANEL_POS_LEFT)
            ws.close_panel(require('ide.panels.panel').PANEL_POS_RIGHT)
        end
    end
    vim.cmd.NvimTreeClose()
    vim.cmd.TagbarClose()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  close_nvim_ide_panels()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- setup telescope extension:
require('telescope').load_extension('dap')



-- lua/modules/tools/dap/dap-lldb.lua

-- other configurations
local codelldb_port = "65472"
dap.adapters.codelldb = {
	type = "server",
	port = codelldb_port,
	executable = {
		command = os.getenv("HOME") .. "/" .. ".local/share/nvim/mason/bin/codelldb", -- installed with mason
		args = { "--port", codelldb_port },
	},
	name = "codelldb",
}

dap.adapters.lldb = {
    type = "executable",
    command = '/usr/bin/lldb-vscode-14',
    name = "lldb"
}
-- copy from cpp with custom type
dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local input = vim.fn.input("Input args: ")
			return vim.fn.split(input, " ", true)
		end,

		runInTerminal = false,
	},
}
