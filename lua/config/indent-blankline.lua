local M = {}

function M.setup(use)
  use 'lukas-reineke/indent-blankline.nvim' -- indent plugin
end

--/** INDENT-BLANKLINE SETUP **/--
require("indent_blankline").setup {
  show_current_context = true,
}

return M
