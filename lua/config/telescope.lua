local M = {}

function M.setup(use)
  use 'nvim-telescope/telescope.nvim' -- Telescope
  use 'nvim-telescope/telescope-ui-select.nvim' --Telecsope code actions extension
  use 'AckslD/nvim-neoclip.lua'
  use { 'nvim-telescope/telescope-frecency.nvim', requires = 'kkharji/sqlite.lua' } -- filepicker(by recency) extension for telescope
end

----/** TELESCOPE SETUP **/--
local telescope = require('telescope')
-- HACK: to make the buffers respect folds when opening via telescope
-- https://github.com/nvim-telescope/telescope.nvim/issues/559#issuecomment-1311441898
-- local telescope_actions = require 'telescope.actions'
-- local function stopinsert(callback)
--   return function(prompt_bufnr)
--     vim.cmd.stopinsert()
--     vim.schedule(function() callback(prompt_bufnr) end)
--   end
-- end

-- local telescope_mappings = {
--   i = {
--     ["<CR>"]  = stopinsert(telescope_actions.select_default),
--     ["<C-x>"] = stopinsert(telescope_actions.select_horizontal),
--     ["<C-v>"] = stopinsert(telescope_actions.select_vertical),
--     ["<C-t>"] = stopinsert(telescope_actions.select_tab)
--   }
-- }
-- HACK-END
telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    -- mappings = telescope_mappings
    mappings = {
      i = { ["<c-x>"] = require("trouble.providers.telescope").open_with_trouble },
      n = { ["<c-x>"] = require("trouble.providers.telescope").open_with_trouble },
    },
  },
  pickers = {
    theme = "dropdown",
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    ["frecency"] = {
      show_scores = true,
      default_workspace = "CWD"
    }
  }
})
telescope.load_extension("ui-select")
telescope.load_extension('neoclip')
telescope.load_extension("frecency")

return M
