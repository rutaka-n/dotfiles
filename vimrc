" my .vimrc file

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Shougo/vimproc.vim'
Plugin 'nanotech/jellybeans.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/LargeFile'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'szw/vim-tags'
Plugin 'Raimondi/delimitMate'

Plugin '907th/vim-auto-save'
Plugin 'myusuf3/numbers.vim'
Plugin 'easymotion/vim-easymotion'

" ruby
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'ngmy/vim-rubocop'
" golang
Plugin 'fatih/vim-go'
"erlang
Plugin 'jimenezrick/vimerl'
Plugin 'vim-erlang/vim-erlang-tags'
" coffee
Plugin 'kchmck/vim-coffee-script'
Plugin 'vitaly/vim-syntastic-coffee'
" haskell
Plugin 'wlangstroth/vim-haskell'
Plugin 'Twinside/vim-syntax-haskell-cabal'
" Plugin 'eagletmt/ghcmod-vim'
call vundle#end()
filetype plugin indent on

syntax on
filetype on
filetype plugin on

let mapleader=","

set t_Co=256
set background=dark
colorscheme jellybeans
set novisualbell

set list
set backspace=indent,eol,start

set cursorline
set lazyredraw
set ttyfast

set hidden
set nofoldenable

if has('mouse')
  set mouse=
  set mousehide
endif

set nowrap
set number
set hlsearch
set ignorecase
set smartcase

set nobackup
set nowb
set noswapfile

set smartindent
set tabstop=4
set expandtab

set wildcharm=<TAB>
set wildmode=list:longest,full
set whichwrap=b,s,<,>,[,],l,h

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

nmap <cr> :nohlsearch<cr>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" syntastic
let g:vimrubocop_config = '~/.rubocop.yml'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'

let g:syntastic_enable_signs=1
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
" let g:syntastic_coffee_coffeelint_args = "--file /usr/local/coffeelint.json"
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Airline
set encoding=utf-8 " Necessary to show Unicode glyphs
set ttimeoutlen=50
let g:airline_theme = 'serene'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" numbers
nnoremap <F2> :NumbersToggle<CR>
let g:numbers_exclude = ['tagbar', 'nerdtree', 'vimshell', 'w3m']

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

let g:vim_tags_auto_generate = 1

let g:buffergator_viewport_split_policy = "B"

" easymotion
map <Leader> <Plug>(easymotion-prefix)

" GitGutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
