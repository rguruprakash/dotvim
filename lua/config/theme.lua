local M = {};
function M.setup(use)
  use { 'ellisonleao/gruvbox.nvim' } -- theme
end
-- local p = {}
-- function p.configabc()
--   -- use { 'ellisonleao/gruvbox.nvim' } -- theme
-- end

--/** GRUVBOX THEME SETUP **/--
 vim.o.background = "dark" -- or "light" for light mode
 vim.cmd([[colorscheme gruvbox]])

return M
