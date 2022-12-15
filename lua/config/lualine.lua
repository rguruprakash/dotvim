local M = {}

function M.setup(use)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
end

require('lualine').setup {
  options = { theme = 'gruvbox' }
}

return M;
