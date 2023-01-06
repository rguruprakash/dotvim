local M = {}

function M.setup(use)
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function()

    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = 'diff2_vertical'
        },
        merge_tool = {
          layout = 'diff3_vertical'
        }
      }
    })
  end } -- git diff plugin
  use { 'lewis6991/gitsigns.nvim', config = function()
    require('gitsigns').setup()
  end }
end

return M
