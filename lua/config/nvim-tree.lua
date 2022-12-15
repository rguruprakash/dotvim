local M = {}

function M.setup(use)
  use 'kyazdani42/nvim-web-devicons' -- dependency of nvim-tree
  use 'kyazdani42/nvim-tree.lua' -- file tree
end

--/** NVIM TREE SETUP **/--
local function search_in_node(node)
  require("telescope.builtin").live_grep { cwd = node.absolute_path }
end
require "nvim-tree".setup {
  view = {
    mappings = {
      list = {
        { key = "S", action = "search_in_node", action_cb = search_in_node }
      }
    }
  }
}

return M
