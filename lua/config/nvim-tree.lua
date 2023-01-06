local M = {}

function M.setup(use)
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      local function search_in_node(node)
        require("telescope.builtin").live_grep({ cwd = node.absolute_path })
      end

      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        view = {
          mappings = {
            list = {
              { key = "S", action = "search_in_node", action_cb = search_in_node },
            },
          },
        },
      })
    end,
  })
end

return M
