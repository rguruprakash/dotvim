local M = {}

function M.setup(use)
	-- use({
	--   "sindrets/diffview.nvim",
	--   requires = "nvim-lua/plenary.nvim",
	--   config = function()
	--     require("diffview").setup({
	--       enhanced_diff_hl = true,
	--       view = {
	--         default = {
	--           layout = "diff2_vertical",
	--         },
	--         merge_tool = {
	--           layout = "diff3_vertical",
	--         },
	--       },
	--       file_panel = {
	--         type = "split",
	--         win_config = {
	--           position = "bottom",
	--           height = 40
	--         }
	--       },
	--     })
	--     vim.cmd [[
	--       hi! DiffChange guibg=#6a5f51
	--       hi! DiffText guibg=#90826f
	--     ]]
	--   end,
	-- }) -- git diff plugin
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
end

return M
