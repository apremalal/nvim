return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "Pocco81/DAPInstall.nvim",
  },
  config= function()
    local dap, dapui = require("dap"), require("dapui")
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

    -- Dart / Flutter
    dap.adapters.dart = {
      type = 'executable',
      command = 'dart',
      args = {'debug_adapter'}
    }
    dap.adapters.flutter = {
      type = 'executable',
      command = 'flutter',
      args = {'debug_adapter'}
    }
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
  end
}
