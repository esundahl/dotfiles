
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:   Erik Sundahl
" Twitter:  @esundahl
" Website:  http://eriksundahl.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Themes
Plug 'esundahl/vim-pastel'

" Tools
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Language
Plug 'mxw/vim-jsx'
Plug 'vim-syntastic/syntastic'

" keep last
Plug 'ryanoasis/vim-devicons'


" Initialize plugin system
call plug#end()

" Theme
colorscheme pastel
highlight SignColumn ctermbg=black
set guifont=Inconsolata:h12
set background=dark

" Set the mapleader key
let mapleader = ","

" Basic Setup
set nocompatible                  " Use vim, no vi defaults
set number                        " Show line numbers
set ruler                         " Show line and column number
syntax enable                     " Turn on syntax highlighting allowing local overrides
set encoding=utf-8                " Set default encoding to UTF-8

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set nolist                        " Hide invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set autoindent
set smartindent

" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

" Copy default register to the system clipboard
set clipboard=unnamed

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeGitStatusUseNerdFonts = 1

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Fixes gitgutter color
highlight SignColumn ctermbg=black

"Saves time; maps the spacebar to coln
nmap <space> :

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Folding options
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " don't fold by default
set foldlevel=1

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-F> :call DWM_Focus()<CR>

nnoremap <silent> <F8> :TagbarToggle<CR>

" Fast saving and exiting
nmap <leader>w :w<cr>
nmap <leader>W :SudoWrite<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
nmap <leader>x :x<cr>
nmap <leader>X :SudoWrite<cr>:q<cr>

" Strip Whitespace on Save
autocmd BufWritePre * :%s/\s\+$//e

" Mappings for Vimdiff
map <leader>1 :diffget LOCAL<CR>
map <leader>2 :diffget BASE<CR>
map <leader>3 :diffget REMOTE<CR>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif

set listchars=tab:▸\ ,eol:¬

" Copy default register to the system clipboard
set clipboard=unnamed
