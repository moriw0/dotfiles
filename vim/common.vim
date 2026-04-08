"----------------------------------------
" Search
"----------------------------------------
set hlsearch
set ignorecase
set smartcase
set incsearch

"----------------------------------------
" Editing
"----------------------------------------
set number
set wrap
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set clipboard=unnamedplus

"----------------------------------------
" Leader
"----------------------------------------
let mapleader = ' '

"----------------------------------------
" Keymaps
"----------------------------------------
" jj/jk でノーマルモードに戻る
inoremap <silent> jk <ESC>
" Esc 2回でハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
