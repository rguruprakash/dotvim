local M = {}

function M.setup(use)
  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          default = {
            layout = "diff2_vertical",
          },
          merge_tool = {
            layout = "diff3_vertical",
          },
        },
        file_panel = {
          win_config = function()
            local c = { type = "float" }
            local editor_width = vim.o.columns
            local editor_height = vim.o.lines
            c.width = math.min(100, editor_width)
            c.height = math.min(24, editor_height)
            c.col = math.floor(editor_width * 0.5 - c.width * 0.5)
            c.row = math.floor(editor_height * 0.5 - c.height * 0.5)
            return c
          end
        },
      })
    end,
  }) -- git diff plugin
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
end

return M
