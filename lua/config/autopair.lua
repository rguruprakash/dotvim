local M = {}

function M.setup(use)
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
end

return M
