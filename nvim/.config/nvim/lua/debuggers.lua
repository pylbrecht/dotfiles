-- FIXME: use a venv with debugpy installed
require('dap-python').setup('python')

require("mason-nvim-dap").setup({
    ensure_installed = { "python" },
    automatic_installation = true
})

local dap = require('dap')
dap.configurations.python = {
    {
        name = 'IGP: FastAPI',
        type = 'python',
        request = 'attach',
        connect = {
            host = 'localhost',
            port = 5678,
        },
        cwd = vim.fn.getcwd(),
        pathMappings = {
            {
                localRoot = vim.fn.getcwd(),
                remoteRoot = "/srv/igp",
            },
        },
    },
}

vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<Leader>dn', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>ds', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)

local dapui = require("dapui")
dapui.setup()
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
