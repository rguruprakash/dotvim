execute pathogen#infect()
filetype plugin indent on

syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" colorscheme monokai

" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
autocmd FileType js setlocal foldmethod=syntax
autocmd FileType html setlocal foldmethod=manual
autocmd FileType scss setlocal foldmethod=indent
autocmd FileType css setlocal foldmethod=indent

" airline
set laststatus=2
let g:airline_powerline_fonts=1

set rnu
set number
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
" set path=$PWD/**
set nobackup
set clipboard=unnamed
let mapleader=","

" Dependencies
" brew install fzf
" brew install the_silver_searcher
" fzf
set rtp+=/usr/local/opt/fzf

" My shortcuts
nmap - :vert resize -5<cr>
nmap = :vert resize +5<cr>
nmap _ :tabm -1<cr>
nmap + :tabm +1<cr>
nmap _ :NERDTreeToggle<cr>
nmap <C-p> :Files<cr>
nmap <C-f> :Ag<cr>
