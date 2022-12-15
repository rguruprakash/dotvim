local M = {}

function M.setup(use)
  use { 'williamboman/mason.nvim' } -- Automate installation of LSP servers
end

require("mason").setup()

return M
