local M = {}

function M.setup(use)
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        highlight = {
          comments_only = false,
        },
      })
    end,
  })
end

return M
