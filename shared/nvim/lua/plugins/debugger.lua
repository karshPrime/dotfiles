-------------------------------------------------------------------------------
--# Debugger #-----------------------------------------------------------------

--# Language DAP config #------------------------------------------------------

local dap = require('dap')
local dapui = require('dapui')

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb',
    name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/bin'
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp

-- DAP UI setup
dapui.setup()

-- Automatically open DAP UI
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end


--# Keybinds #-----------------------------------------------------------------

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

vim.api.nvim_set_keymap('n', '<leader>dc',
    "<cmd>lua require'dap'.continue()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dso',
    "<cmd>lua require'dap'.step_over()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dsi',
    "<cmd>lua require'dap'.step_into()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dsu',
    "<cmd>lua require'dap'.step_out()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>db',
    "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dB',
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dp',
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dr',
    "<cmd>lua require'dap'.repl.open()<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>dl',
    "<cmd>lua require'dap'.run_last()<CR>",
    { noremap = true, silent = true }
)


