set exrc
set secure

call plug#begin('~/.config/nvim/plugged')
" ui
" Plug 'nanotech/jellybeans.vim'
" Plug 'sainnhe/everforest'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'itchyny/lightline.vim'

" editiing
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

" languages
Plug 'kamykn/spelunker.vim'

" file manager
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" paredit for lisp-like editing
" Plug 'vim-scripts/paredit.vim'

" tagbar
Plug 'majutsushi/tagbar'

" Copilot
" Plug 'github/copilot.vim'

" Tmux
" vim-plug
Plug 'alexghergh/nvim-tmux-navigation'

Plug 'dense-analysis/ale'
call plug#end()

syntax enable
filetype on
filetype plugin on

" set local include path
let &path.="src/include,/usr/include/AL,"

let mapleader=","

set background=dark
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

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
set colorcolumn=120
set ttyfast                           " Optimize for fast terminal connections
set lazyredraw
set encoding=utf-8                    " Set the default encodings just in case $LANG isn't set
set nowrap                            " Don't wrap lines
set number                            " Enable line numbers

set nowritebackup                     " Don't create a backup when overwriting a file
set noswapfile                        " Don't write swap files
set nobackup                          " Don't keep backup files

set nojoinspaces                      " Don't add 2 spaces when using J
set laststatus=2

set scrolloff=15                      " Lines the cursor is to the edge before scrolling

" map unnamed buffer to system X buffer
set clipboard+=unnamed

" search options
set hlsearch
set ignorecase
set smartcase

" ALE
let g:ale_set_balloons = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 1
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gy <Plug>(ale_go_to_type_definition)
nmap <silent> gi <Plug>(ale_go_to_implementation)
nmap <silent> gr <Plug>(ale_find_references)
nmap <silent> <leader>k <Plug>(ale_hover)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt'],
\}

" search definition with git tags
" gotags -tag-relative -f .git/tags -R api/
set tags+=.git/tags

" mapping
nmap <cr> :nohlsearch<cr>

" GitGutter
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

nmap <leader>a <Plug>CtrlSFPrompt

" map FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :BCommits<CR>
nnoremap <leader>C :Commits<CR>
nnoremap <leader>h :History:<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" nerdtree
nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

nmap <F8> :TagbarToggle<CR>

" plugin configuration

" autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" spelunker
let g:enable_spelunker_vim = 0
let g:spelunker_target_min_char_len = 3

" use rg for ctrlsf
let g:ctrlsf_backend = 'rg'

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

