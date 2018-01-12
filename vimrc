set nocompatible
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/vimproc.vim'
" themes
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'nanotech/jellybeans.vim'
" statusline
Plug 'itchyny/lightline.vim'
" some defaults
Plug 'tpope/vim-sensible'
" manipulate surround characters
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
" commetary
Plug 'tpope/vim-commentary'
" repeat works everywhere
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-unimpaired'

Plug 'terryma/vim-multiple-cursors'

" search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

" comand provider into tmux
Plug 'benmills/vimux'

" run test from vim
Plug 'janko-m/vim-test'

" auto enable lazyloading for large file
Plug 'vim-scripts/LargeFile'
" syntax checking
" file manager
Plug 'scrooloose/nerdtree'
" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" refactoring
Plug 'vim-scripts/DirDo.vim'

"Plug 'szw/vim-tags'
" autosave
Plug '907th/vim-auto-save'

Plug 'editorconfig/editorconfig-vim'

" ruby
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" Erlang
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }
" elixir
Plug 'elixir-lang/vim-elixir'
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" golang
Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()
syntax enable
filetype on
filetype plugin on

let mapleader=","

set background=dark
colorscheme jellybeans

set novisualbell

" disable mouse
if has('mouse')
  set mouse=
  set mousehide
endif

" if using smthelse
set shell=/bin/sh

set cursorline                        " Highlight current line
set smartindent                       " Smart auto-indent when creating a new line
set colorcolumn=80
set ttyfast                           " Optimize for fast terminal connections
" set lazyredraw
set encoding=utf-8                    " Set the default encodings just in case $LANG isn't set
set nowrap                            " Don't wrap lines
set number                            " Enable line numbers
" set relativenumber
set nowritebackup                     " Don't create a backup when overwriting a file
set noswapfile                        " Don't write swap files
set nobackup                          " Don't keep backup files
set hidden
set nofoldenable
set scrolloff=5                       " Lines the cursor is to the edge before scrolling
set complete-=i                       " set complete=.,w,b,u,t
set completeopt=menu,preview
" Show whitespace
set list
set listchars=trail:·,tab:▸\ ,eol:¬
set nojoinspaces                      " Don't add 2 spaces when using J

" map unnamed buffer to system X buffer
set clipboard+=unnamed

" search options
set hlsearch
set ignorecase
set smartcase

nmap <cr> :nohlsearch<cr>

" path to find completion
set path+=**

" enable menu for completion
set wildmenu
set wildcharm=<TAB>
set wildmode=list:longest,full
set whichwrap=b,s,<,>,[,],l,h
" use git tags
set tags+=.git/tags

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" GitGutter
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

nmap <leader>a <Plug>CtrlSFPrompt
" nnoremap <leader>a :Ag<CR>

" map FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"✗":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ">", 'right': "<" },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#strategy = "vimux"

function! PrintCStyleCopyright()
    let year = system('date +"%Y"')[0:3]
    call setline(1, '// Copyright © ' . year . ' Vladislav Promzelev (rutaka.nashimo@yandex.ru)')
    call setline(2, '// License: https://opensource.org/licenses/MIT')
endfunction

function! PrintPythonCopyright()
    let year = system('date +"%Y"')[0:3]
    call setline(1, '#!/usr/bin/python')
    call setline(2, '')
    call setline(3, '# Copyright © ' . year . ' Vladislav Promzelev (rutaka.nashimo@yandex.ru)')
    call setline(4, '# License: https://opensource.org/licenses/MIT')
endfunction

function! PrintRubyCopyright()
    let year = system('date +"%Y"')[0:3]
    call setline(1, '# Copyright © ' . year . ' Vladislav Promzelev (rutaka.nashimo@yandex.ru)')
    call setline(2, '# License: https://opensource.org/licenses/MIT')
endfunction

function! PrintBashCopyright()
    let year = system('date +"%Y"')[0:3]
    call setline(1, '#!/bin/bash')
    call setline(2, '')
    call setline(3, '# Copyright © ' . year . ' Vladislav Promzelev (rutaka.nashimo@yandex.ru)')
    call setline(4, '# License: https://opensource.org/licenses/MIT')
endfunction

" TODO: move it to plugin!

au BufNewFile *.{cpp,h,hpp,go} :call PrintCStyleCopyright()
au BufNewFile *.py :call PrintPythonCopyright()
au BufNewFile *.sh :call PrintBashCopyright()
au BufNewFile *.rb :call PrintRubyCopyright()
