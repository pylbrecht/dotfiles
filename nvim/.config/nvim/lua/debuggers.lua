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
