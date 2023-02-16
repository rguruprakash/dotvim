local M = {}

function M.setup(use)
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup({
        -- auto_preview = true,
        -- position = 'bottom'
      })
    end,
  })
end

return M
