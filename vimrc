call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/L9' " dependency for other plugins 
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " for git
Plug 'airblade/vim-gitgutter' " to show git diff in the 'gutter' 
Plug 'tpope/vim-rhubarb' " for github 
Plug 'mkitt/tabline.vim' " for tabs
Plug 'vim-airline/vim-airline' " for status line
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'chriskempson/base16-vim' " for base16-ocean theme
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'jparise/vim-graphql'

call plug#end()

syntax on
set background=dark
colorscheme base16-ocean

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

" highlights config
" hi ALEWarning cterm=underline ctermfg=3 guifg=#ebcb8b
" hi ALEError cterm=underline ctermfg=1 gui=underline guifg=#bf616a
" hi SpellBad cterm=underline ctermfg=1 gui=underline guifg=#bf616a

" Code folding
" function! CustomFoldText()
"     return substitute(getline(v:foldstart), "$", " ...", "g")
" endfunction

" set foldtext=CustomFoldText()
" set fillchars=fold:\  
" set foldlevel=99 " unfold everything initially
augroup code_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
    au FileType javascript.jsx setlocal foldmethod=syntax
    au FileType typescript setlocal foldmethod=syntax
    au FileType typescript.tsx setlocal foldmethod=syntax
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

" =============== COC =============== "
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd! CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" =============== COC =============== "

" airline
set laststatus=2

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

"Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-javascript - for syntax highlighting
let g:javascript_plugin_jsdoc=1 " syntax highlighting jsdocs
let g:javascript_plugin_ngdoc=1 " syntax highlighting ngdocs
let g:javascript_plugin_flow=1 " syntax highlighting flow (https://flow.org/)

" Git gutter
nmap ghp <Plug>(GitGutterPreviewHunk)

" My commands
command! W :w
command! Q :q
command! VimConfig :e ~/.vimrc

" My shortcuts
nmap - :vert resize -5<cr>
nmap = :vert resize +5<cr>
nmap – :resize -5<cr>
nmap ≠ :resize +5<cr>
nmap _ :NERDTreeToggle<cr>
nmap <C-f> :LAck!<Space>
nmap <C-p> :GFiles<cr>
nmap <leader>- :NERDTreeFind<cr>
nmap <leader>f :Filetypes<cr>
nmap <leader>r :source ~/.vimrc<cr>
nmap <leader>o :silent !atom %:p<cr>
