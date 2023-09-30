local M = {}

function M.setup(use)
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
			-- require("indent_blankline").setup({
			-- 	show_current_context = true,
			-- })
		end,
	}) -- indent plugin
end

return M
