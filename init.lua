vim.cmd([[
syntax on

set rnu
set number
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set nobackup
set nowritebackup
set clipboard=unnamed " share clipboard
set autoread
set cmdheight=2
let mapleader=","
set mouse=""
set cursorline
set noswapfile
set updatetime=100

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" My shortcuts
nmap _ :NvimTreeToggle<cr>
nmap z= :Telescope spell_suggest<cr>
nmap <C-f> :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nmap <C-p> :lua require"config.telescope".project_files()<cr>
nmap <C-l> :Telescope treesitter<cr>
nmap <leader>- :NvimTreeFindFile!<cr>
nmap <leader>f :Telescope filetypes<cr>
nmap <leader>r :luafile %<cr>
nmap <leader>c :tabe ~/.vim/init.lua<cr>
nmap <leader>p :lua require'telescope'.extensions.projects.projects{}<cr>
nmap <leader>w :WinResizerStartResize<cr>
nmap gsp :Gitsigns preview_hunk<cr>
nmap gsr :Gitsigns reset_hunk<cr>
nmap <leader>lg :LazyGit<cr>
"command! D :DiffviewOpen
"command! Dfh :DiffviewFileHistory
"command! Dc :tabc
]])

require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim") -- Package manager
		use("simeji/winresizer")
		use("mg979/vim-visual-multi")
		use("tpope/vim-commentary")
		use("tpope/vim-fugitive")
		use("tpope/vim-rhubarb")
		use("nvim-lua/plenary.nvim")
		use("tpope/vim-surround")
		use("nvim-treesitter/nvim-treesitter")
		use("easymotion/vim-easymotion")
		use({
			"folke/which-key.nvim",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})
		use({ "github/copilot.vim" })

		-- PRESERVE ORDER
		require("config.theme").setup(use)
		require("config.bufferline").setup(use)
		require("config.treesitter").setup(use)
		require("config.project").setup(use)
		require("config.telescope").setup(use)
		require("config.neodev").setup(use)
		require("config.lspconfig").setup(use)
		require("config.mason").setup(use)
		require("config.autocomplete").setup(use)
		require("config.git").setup(use)
		require("config.indent-blankline").setup(use)
		require("config.fold").setup(use)
		require("config.nvim-tree").setup(use)
		require("config.autopair").setup(use)
		require("config.dap").setup(use)
		require("config.symbol-outline").setup(use)
		require("config.trouble").setup(use)
		require("config.cheatsheet").setup(use)
		require("config.lualine").setup(use)
		require("config.mini").setup(use)
		-- require("config.todo-comments").setup(use)

		-- CUSOM FUCTIONS
		require("config.notes-scratch")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
