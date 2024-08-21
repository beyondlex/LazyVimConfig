return {
  "mxsdev/nvim-dap-vscode-js",
  config = function()
    require("dap-vscode-js").setup({
      -- https://github.com/mxsdev/nvim-dap-vscode-js?tab=readme-ov-file
      -- ~/.local/share/nvim/
      log_file_path = vim.fn.stdpath('data') .. '/lazy/nvim-dap-vscode-js.log',
      log_file_level = vim.log.levels.WARN,
      debugger_path = vim.fn.expand('~') .. '/code/lib/vscode-js-debug',
      adapters = {
        'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge',
        'node-terminal', 'pwa-extensionHost', 'node',
      }
    })
  end,

  dependencies = {

    {
      "mfussenegger/nvim-dap",
      config = function()
        local js_based_languages = { "typescript", "javascript", "typescriptreact" }

        for _, language in ipairs(js_based_languages) do
          require("dap").configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
              -- runtimeExecutable = '/Users/lex/Library/Caches/fnm_multishells/60593_1724047895857/bin/tsx',
              runtimeExecutable = 'tsx',
              -- sourceMaps = true,
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require 'dap.utils'.pick_process,
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-chrome",
              request = "launch",
              name = "Start Chrome with \"localhost\"",
              url = "http://localhost:3000",
              webRoot = "${workspaceFolder}",
              userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
            }
          }
        end
      end,
    }
  },
}
