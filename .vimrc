" Required for Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'

" Configuration
Plugin 'tpope/vim-sensible'

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-git'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'mmalecki/vim-node.js'
Plugin 'groenewege/vim-less'

" Tools
Plugin 'itspriddle/ZoomWin'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-endwise'
Plugin 'ap/vim-css-color'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'


" Required for Vundle
filetype plugin indent on

" Set the mapleader key
let mapleader = ","

" enable line numbers
set number

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

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

" Copy default register to the system clipboard
set clipboard=unnamed

" Fixes gitgutter color
highlight SignColumn ctermbg=black
