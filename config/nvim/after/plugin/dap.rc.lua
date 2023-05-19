local dap = require('dap')
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = 'codelldb',
        args = {"--port", "${port}"},
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- dapui
require("dapui").setup()
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- keybinds
local opts = { silent = true }
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>", opts)
vim.keymap.set("n", "<leader>dr", ":lua require('dap').restart()<CR>", opts)
vim.keymap.set("n", "<leader>dq", ":lua require'dapui'.close(); require('dap').disconnect()<CR>", opts)
vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<CR>", opts)
vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<CR>", opts)
