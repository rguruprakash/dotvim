require 'packer'.startup({ function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- PRESERVE ORDER
  require 'config.theme'.setup(use)
  require 'config.treesitter'
  require 'config.telescope'.setup(use)
  require 'config.neodev'.setup(use)
  require 'config.lsp'.setup(use)
  require 'config.autocomplete'.setup(use)
  require 'config.diffview'.setup(use)
  require 'config.fold'.setup(use)
  require 'config.nvim-tree'.setup(use)
  require 'config.indent-blankline'.setup(use)
  require 'config.autopair'.setup(use)
  require 'config.mason'.setup(use)
  require 'config.dap'.setup(use)
  require 'config.symbol-outline'.setup(use)
  require 'config.trouble'.setup(use)
  require 'config.cheatsheet'.setup(use)
  require 'config.lualine'.setup(use)
end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
})

-- TODO
-- Setup DAP for Go lang
-- Configure yamlls to validate k8s yaml
