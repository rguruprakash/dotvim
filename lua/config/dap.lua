local M = {}

function M.setup(use)
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } } -- dap ui with dap adapter
end

require("dapui").setup()

local dap = require 'dap';

dap.adapters.delve = {
  type = 'server',
  port = '58372',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l --check-go-version=false', '127.0.0.1:58372' },
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "ps ax | grep monroe-api | grep -v grep | cut -f 1 -d"
  },
  -- {
  --   type = "delve",
  --   name = "Debug test", -- configuration for debugging test files
  --   request = "launch",
  --   mode = "test",
  --   program = "${file}"
  -- },
  -- works with go.mod packages and sub packages
  -- {
  --   type = "delve",
  --   name = "Debug test (go.mod)",
  --   request = "launch",
  --   mode = "test",
  --   program = "./${relativeFileDirname}"
  -- }
}

return M
