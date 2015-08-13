"my .vimrc file

set nocompatible
filetype off
set shell=/bin/bash

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
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/LargeFile'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'

Plugin '907th/vim-auto-save'
Plugin 'myusuf3/numbers.vim'

"ruby
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'ngmy/vim-rubocop'
"golang
Plugin 'fatih/vim-go'
"erlang
Plugin 'jimenezrick/vimerl'
Plugin 'vim-erlang/vim-erlang-tags'
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
set listchars=tab:>.,trail:.
set backspace=indent,eol,start

set lazyredraw
set ttyfast

set cursorcolumn
set cursorline
set hidden
set nofoldenable

if has('mouse')
  set mouse=a
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

set autoindent
set smartindent
set tabstop=4
set expandtab

set wildmenu
set wildcharm=<TAB>
set wildmode=list:longest,full
set whichwrap=b,s,<,>,[,],l,h

nmap <cr> :nohlsearch<cr>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" rubocop config
let g:vimrubocop_config = '~/.rubocop.yml'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '~/.rbenv/shims/rubocop'

" Airline
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set ttimeoutlen=50
let g:airline_theme = 'serene'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

nmap <F8> :TagbarToggle<CR>

"numbers
nnoremap <F2> :NumbersToggle<CR>
let g:numbers_exclude = ['tagbar', 'nerdtree', 'vimshell', 'w3m']

"autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

let g:buffergator_viewport_split_policy = "B"
