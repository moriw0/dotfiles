"----------------------------------------
" 検索
"----------------------------------------
" 検索結果をハイライト表示
set hlsearch
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 対応する括弧を強調表示
set showmatch
" 行番号を表示
set number
" シンタックスハイライト
syntax on
set background=dark
" 全ての数を10進数として扱う 
set nrformats=
" ヤンクでクリップボードにコピー
" set clipboard=unnamed,autoselect
set tabstop=2
set shiftwidth=2
" 改行時に自動でインデントする
set smartindent
" ビープ音を可視化
set visualbell
" タブ入力を複数の空白入力に置き換える
set expandtab

"----------------------------------------
" ショートカット
"----------------------------------------
" \s で空白削除
nnoremap <leader>s :%s/\s\+//g<CR>
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" 直前の置換コマンドを繰り返す
nnoremap & :&&<CR>
xnoremap & :&&<CR>

"----------------------------------------
" 日本語入力補助
"----------------------------------------
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
" jjでエスケープ
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>
"----------------------------------------
" コマンド関連
"----------------------------------------
" Tab で補完リストを表示する (<C-d>)のかわり)
set wildmenu
set wildmode=full
" コマンド履歴を矢印以外でも実施
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"----------------------------------------
" プラグイン関連
"----------------------------------------
" ファイルシステム探索
set nocompatible
filetype plugin on
" matchit: 対となるキーワード間を移動できるようにする
runtime macros/matchit.vim
" commentary.vim を使えるようにする cf.https://github.com/tpope/vim-commentary?tab=readme-ov-file#installation
filetype plugin indent on
" jetpack プラグインマネージャ
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'tpope/vim-commentary'
Jetpack 'tpope/vim-unimpaired' " リストをさくさく移動する
Jetpack 'morhetz/gruvbox'
Jetpack 'nelstrom/vim-visual-star-search'
Jetpack 'nelstrom/vim-qargs'
" Javasctipt のシンタックス関連
Jetpack 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Jetpack 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Jetpack 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Jetpack 'othree/html5.vim'
Jetpack 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }

call jetpack#end()
" カラースキーム
"colorscheme evening
autocmd vimenter * ++nested colorscheme gruvbox
