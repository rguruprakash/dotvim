local M = {}

function M.setup(use)
  use { 'jose-elias-alvarez/null-ls.nvim', config = function()
    local null_ls = require("null-ls")
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua
      }
    }
  end }
end

return M;
