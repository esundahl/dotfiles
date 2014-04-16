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
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'

" Themes
Plugin 'esundahl/vim-pastel'

" Tools
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
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
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'msanders/snipmate.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'esundahl/vim-snippets'
Plugin 'scrooloose/nerdcommenter'

" Required for Vundle
filetype plugin indent on

" Theme
colorscheme pastel
highlight SignColumn ctermbg=black
let g:airline_theme='bubblegum'

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
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

" File Types
if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

   " Treat JSON files like JavaScript
   au BufNewFile,BufRead *.json set ft=javascript

    " Remember last location in file, but not for commit messages.
    " " see :help last-position-jump
    au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif
endif

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q


" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Status Line
if has("statusline") && !&cp
  set laststatus=2 " always show the status bar

" Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

" Smart way to move btw. windows
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-h> :wincmd h<CR>
map <C-l> :wincmd l<CR>

" Use arrows for buffer switching
map <right> :bn<cr>
map <left> :bp<cr>

" Saving & Quitting
nmap <C-w> :w<CR>
nmap <C-c> :wq<CR>

" Strip Whitespace on Save
autocmd BufWritePre * :%s/\s\+$//e

" Mappings for Vimdiff
map <leader>1 :diffget LOCAL<CR>
map <leader>2 :diffget BASE<CR>
map <leader>3 :diffget REMOTE<CR>

" Copy default register to the system clipboard
set clipboard=unnamed

" Fugitive
nmap <Leader><Leader>gb :Gblame<CR>
nmap <Leader><Leader>gs :Gstatus<CR>
nmap <Leader><Leader>gd :Gdiff<CR>
nmap <Leader><Leader>gl :Glog<CR>
nmap <Leader><Leader>gc :Gcommit<CR>
nmap <Leader><Leader>gp :Git push<CR>
nmap <Leader><Leader>gw :Gwrite<CR>

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
