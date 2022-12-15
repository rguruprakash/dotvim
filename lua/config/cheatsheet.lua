local M = {}

function M.setup(use)
  use { 'sudormrfbin/cheatsheet.nvim', --cheatsheet
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    }
  }
end

return M
