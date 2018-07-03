execute pathogen#infect()
filetype plugin indent on

syntax on
set background=dark
colorscheme solarized

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
set nobackup
set clipboard=unnamed
let mapleader=","

" Code folding
set foldlevel=99 " unfold everything initially
augroup code_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
    au FileType html setlocal foldmethod=manual
    au FileType scss setlocal foldmethod=indent
    au FileType css setlocal foldmethod=indent
augroup END 

" --------------
" PLUGINS CONFIG
" --------------

" vim-javascript - for syntax highlighting
let g:javascript_plugin_jsdoc=1 " syntax highlighting jsdocs
let g:javascript_plugin_ngdoc=1 " syntax highlighting ngdocs
let g:javascript_plugin_flow=1 " syntax highlighting flow (https://flow.org/)

" airline
set laststatus=2

" fzf - for search all and ctrlp feature
" Dependencies
" brew install fzf
" brew install the_silver_searcher
set rtp+=/usr/local/opt/fzf

" My shortcuts
nmap - :vert resize -5<cr>
nmap = :vert resize +5<cr>
nmap _ :tabm -1<cr>
nmap + :tabm +1<cr>
nmap _ :NERDTreeToggle<cr>
nmap <C-p> :Files<cr>
nmap <C-f> :Ag<cr>
