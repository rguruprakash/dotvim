call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9' " dependency for other plugins 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " for git
Plug 'airblade/vim-gitgutter' " to show git diff in the 'gutter' 
Plug 'tpope/vim-rhubarb' " for github 
Plug 'mkitt/tabline.vim' " for tabs
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'easymotion/vim-easymotion'

call plug#end()

syntax on
set background=dark

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
set showtabline=2

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" Git gutter
nmap ghp <Plug>(GitGutterPreviewHunk)

" My shortcuts
nmap _ :NvimTreeToggle<cr>
nmap <C-f> :Telescope live_grep<cr>
nmap <C-p> :Telescope frecency<cr>
nmap <C-l> :Telescope treesitter<cr>
nmap <C-y> :Telescope neoclip<cr>
nmap <leader>- :NvimTreeFindFile<cr>
nmap <leader>f :Telescope filetypes<cr>
nmap <leader>r :source ~/.vimrc<cr>
nmap <leader>rl :luafile ~/.config/nvim/lua/config.lua<cr>
nmap <leader>c :tabe ~/.vimrc<cr>
nmap <leader>cl :tabe ~/.config/nvim/lua/config.lua<cr>

lua << EOF
    require('config')
EOF
