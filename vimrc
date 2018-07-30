call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-haml'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
Plug 'mkitt/tabline.vim'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

syntax on
set background=dark
colorscheme base16-ocean

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
set nowritebackup
set clipboard=unnamed " share clipboard
let mapleader=","

" Code folding
function! CustomFoldText()
    return substitute(getline(v:foldstart), "$", " ...", "g")
endfunction

set foldtext=CustomFoldText()
set fillchars=fold:\  
set foldlevel=99 " unfold everything initially
augroup code_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
    au FileType typescript setlocal foldmethod=syntax
    au FileType json setlocal foldmethod=syntax
    au FileType html setlocal foldmethod=manual
    au FileType scss setlocal foldmethod=indent
    au FileType css setlocal foldmethod=indent
augroup END

" Tabline
set showtabline=2

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
nmap <leader>- :NERDTreeFind<cr>
nmap <C-p> :Files<cr>
nmap <C-f> :Ag<cr>
nmap <leader>f :Filetypes<cr>
nmap <leader>r :source ~/.vimrc<cr>
nmap <leader>c :Gcommit<cr>
nmap <leader>d :Gdiff<cr>
