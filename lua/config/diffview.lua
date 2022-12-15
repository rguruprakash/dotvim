local M = {}

function M.setup(use)
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- git diff plugin
end

--/** DIFFVIEW PLUGIN **/--
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

return M
