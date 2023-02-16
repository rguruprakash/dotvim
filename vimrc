call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9' " dependency for other plugins 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " for git
" Plug 'airblade/vim-gitgutter' " to show git diff in the 'gutter' 
Plug 'tpope/vim-rhubarb' " for github 
" Plug 'mkitt/tabline.vim' " for tabs
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'easymotion/vim-easymotion'
" Plug 'liuchengxu/vim-which-key'
" Plug 'rcarriga/nvim-notify'

call plug#end()

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

" --------------
" --------------
" PLUGINS CONFIG
" --------------
" --------------

" Tabline
" set showtabline=2

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" Git gutter
" nmap ghp <Plug>(GitGutterPreviewHunk)

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

lua << EOF
    require('config')
EOF
