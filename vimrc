execute pathogen#infect()
filetype plugin indent on

syntax on
" set background=dark
colorscheme monokai
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
" colorscheme material-theme 
" colorscheme wombat 

" Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'a'
set wildignore+=*/node_modules/*


" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" vim javascript
" let b:javascript_fold=1
" let javascript_enable_domhtmlcss=1

" lightline
set laststatus=2

set rnu 
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
" set path=$PWD/**
set nobackup
set clipboard=unnamed
let mapleader=","

" My shortcuts
nmap - :vert resize -5<cr>
nmap = :vert resize +5<cr>
nmap [ :tabm -1<cr>
nmap ] :tabm +1<cr>
" nmap t :tabf 
" nmap s :vert sf 
nmap _ :NERDTreeToggle<cr>
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
