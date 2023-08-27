local M = {}

function M.setup(use)
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- "AckslD/nvim-neoclip.lua",
			-- {
			--   "nvim-telescope/telescope-fzf-native.nvim",
			--   run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			-- },
			-- { "danielfalk/smart-open.nvim", requires = "tami5/sqlite.lua" }
		},
		config = function()
			local telescope = require("telescope")
			local lga_actions = require("telescope-live-grep-args.actions")
			telescope.setup({
				defaults = {
					layout_strategy = "vertical",
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
						require("telescope.themes").get_dropdown({}),
					},
					ive_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<c-k>"] = lga_actions.quote_prompt(),
								["<c-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
					-- ["frecency"] = {
					-- show_scores = true,
					-- default_workspace = "CWD",
					-- },
					-- fzf = {
					--   fuzzy = true, -- false will only do exact matching
					--   override_generic_sorter = true, -- override the generic sorter
					--   override_file_sorter = true, -- override the file sorter
					--   case_mode = "smart_case", -- or "ignore_case" or "respect_case". the default case_mode is "smart_case"
					-- },
				},
			})
			-- telescope.load_extension("neoclip")
			-- telescope.load_extension("fzf")
			telescope.load_extension("projects")
			telescope.load_extension("live_grep_args")
			-- telescope.load_extension("smart_open")
		end,
	})
end

return M
