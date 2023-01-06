local M = {}

function M.setup(use)
  use { 'williamboman/mason.nvim', config = function()
    require("mason").setup()
  end }
end

return M
