call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9' " dependency for other plugins 
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " for git
Plug 'tpope/vim-rhubarb' " for github 
Plug 'mkitt/tabline.vim' " for tabs
Plug 'vim-airline/vim-airline' " for status line
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim' " for base16-ocean theme
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'maksimr/vim-jsbeautify'

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

" highlights config
hi ALEWarning cterm=underline ctermfg=3 guifg=#ebcb8b
hi ALEError cterm=underline ctermfg=1 gui=underline guifg=#bf616a
hi SpellBad cterm=underline ctermfg=1 gui=underline guifg=#bf616a

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

" airline
set laststatus=2

" ale
let g:ale_javascript_prettier_options = '--print-width 80 --tab-width 2 --trailing-comma all --single-quote'
let g:ale_fixers = {
\   'javascript.jsx': ['prettier', 'eslint'],
\   'javascript': ['prettier', 'eslint'],
\   'less': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" fzf
" for search all and ctrlp feature
"
" Dependencies
" brew install fzf
" brew install the_silver_searcher
set rtp+=/usr/local/opt/fzf
" hide fzf statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" vim-javascript - for syntax highlighting
let g:javascript_plugin_jsdoc=1 " syntax highlighting jsdocs
let g:javascript_plugin_ngdoc=1 " syntax highlighting ngdocs
let g:javascript_plugin_flow=1 " syntax highlighting flow (https://flow.org/)

" My shortcuts
nmap - :vert resize -5<cr>
nmap = :vert resize +5<cr>
nmap – :resize -5<cr>
nmap ≠ :resize +5<cr>
nmap _ :NERDTreeToggle<cr>
nmap <leader>- :NERDTreeFind<cr>
nmap <C-f> :Ag<cr>
nmap <C-p> :Files<cr>
nmap <leader>f :Filetypes<cr>
nmap <leader>r :source ~/.vimrc<cr>
