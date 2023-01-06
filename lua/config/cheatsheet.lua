local M = {}

function M.setup(use)
  use { 'sudormrfbin/cheatsheet.nvim', --cheatsheet
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("cheatsheet").setup({
        bundled_cheatsheets = false,
      })
    end
  }
end

return M
