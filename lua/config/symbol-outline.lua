local M = {}

function M.setup(use)
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup({})
    end,
  })
end

return M
