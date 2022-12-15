local M = {}

function M.setup(use)
  use 'folke/neodev.nvim' -- documentation for nvim lua apis
end

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup()

return M;
