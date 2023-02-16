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

lua << EOF
    require('config')
EOF
