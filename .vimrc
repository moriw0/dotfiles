source ~/dotfiles/vim/common.vim

set laststatus=2
set showcmd
set showmatch
syntax on
set background=dark
set nrformats=
set visualbell

" \s で空白削除
nnoremap <leader>s :%s/\s\+//g<CR>
" 直前の置換コマンドを繰り返す
nnoremap & :&&<CR>
xnoremap & :&&<CR>

set wildmenu
set wildmode=full
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

set nocompatible
filetype plugin indent on
" matchit: 対となるキーワード間を移動できるようにする
runtime macros/matchit.vim

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'tpope/vim-commentary'
Jetpack 'tpope/vim-unimpaired'
Jetpack 'morhetz/gruvbox'
Jetpack 'nelstrom/vim-visual-star-search'
call jetpack#end()

"colorscheme evening
autocmd vimenter * ++nested colorscheme gruvbox
