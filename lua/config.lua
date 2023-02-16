vim.cmd [[
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

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" My shortcuts
nmap _ :NvimTreeToggle<cr>
nmap z= :Telescope spell_suggest<cr>
nmap <C-f> :Telescope live_grep<cr>
nmap <C-p> :Telescope find_files<cr>
nmap <C-l> :Telescope treesitter<cr>
nmap <C-y> :Telescope neoclip<cr>
nmap <leader>- :NvimTreeFindFile<cr>
nmap <leader>f :Telescope filetypes<cr>
nmap <leader>r :source ~/.vimrc<cr>
nmap <leader>rl :luafile ~/.config/nvim/lua/config.lua<cr>
nmap <leader>c :tabe ~/.vimrc<cr>
nmap <leader>cl :tabe ~/.config/nvim/lua/config.lua<cr>
nmap <leader>m :MindOpenMain<cr>
nmap <leader>mc :MindClose<cr>
nmap <leader>p :lua require'telescope'.extensions.projects.projects{}<cr>
nmap <leader>w :WinResizerStartResize<cr>
command D :DiffviewOpen
command Dfh :DiffviewFileHistory
comman  Dc :tabc
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" set timeoutlen=500
]]

require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim") -- Package manager
		use("simeji/winresizer")
		use("mg979/vim-visual-multi")
		use("tpope/vim-commentary")
		use("tpope/vim-fugitive")
		use("tpope/vim-rhubarb")
		use("mkitt/tabline.vim")
		use("nvim-lua/plenary.nvim")
		use("tpope/vim-surround")
		use("nvim-treesitter/nvim-treesitter")
		use("easymotion/vim-easymotion")

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
		require("config.fold").setup(use)
		require("config.nvim-tree").setup(use)
		require("config.indent-blankline").setup(use)
		require("config.autopair").setup(use)
		require("config.dap").setup(use)
		require("config.symbol-outline").setup(use)
		require("config.trouble").setup(use)
		require("config.cheatsheet").setup(use)
		require("config.lualine").setup(use)
		require("config.notes").setup(use)
		require("config.mini").setup(use)
		require("config.todo-comments").setup(use)
		require("config.null-ls").setup(use)
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
-- vim.opt.numberwidth = 3
-- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

-- vim.cmd[[
--   let &stc='%#NonText#%{&nu?v:lnum:""}%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
-- ]]
--
-- TODO:
-- Setup DAP for Go lang
-- Configure yamlls to validate k8s yaml
-- dont focus notify buffer
