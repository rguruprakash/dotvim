local M = {}

function M.setup(use)
	use({
		"echasnovski/mini.nvim",
		config = function()
			require("mini.splitjoin").setup()
			-- require("mini.animate").setup({
			--   cursor = {
			--     enable = false,
			--   },
			-- })
		end,
	})
end

return M
