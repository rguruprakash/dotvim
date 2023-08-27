local M = {}

function M.setup(use)
	use({
		"folke/neodev.nvim", -- documentation for nvim lua apis
		config = function()
			-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
			require("neodev").setup()
		end,
	})
end

return M
