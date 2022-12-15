local M = {}

function M.setup(use)
  use 'windwp/nvim-autopairs' --autopair plugin
end

--/** AUTOPAIRS PLUGIN SETUP **/--
require('nvim-autopairs').setup {}

return M
