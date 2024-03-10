return {
  "mfussenegger/nvim-dap",
  dependencies = {
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
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath ="/Users/anu/programs/flutter/bin/dart", -- ensure this is correct 
        flutterSdkPath = "/Users/anu/programs/flutter/bin/flutter",                  -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
        cwd = "${workspaceFolder}",
      },
      {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "/Users/anu/programs/flutter/bin/dart", -- ensure this is correct
        flutterSdkPath = "/Users/anu/programs/flutter/bin/flutter",             -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
        cwd = "${workspaceFolder}",
      }
    }

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dc', dap.continue, {})
  end
}
