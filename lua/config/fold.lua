local M = {}

function M.setup(use)
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' } -- folding plugin
end

--/** FOLD PLUGIN SETUP **/--
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
require('ufo').setup({
  provider_selector = function()
    return { 'treesitter', 'indent' }
  end
})
-- local saveAndLoadViews = vim.api.nvim_create_augroup("saveAndLoadViews", { clear = true })
-- vim.cmd [[set viewoptions=folds,cursor]]
-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = "*.*",
--   command = "mkview",
--   group = saveAndLoadViews,
--   desc = "Save view on leaving buffer",
-- })
-- -- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*.*",
--   command = "silent! loadview",
--   group = saveAndLoadViews,
--   desc = "Load view on entering buffer",
-- })

return M
