local M = {}

function M.setup(use)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = { theme = 'gruvbox' }
      }
    end
  }
end

return M;
