" syntax highlight
syntax enable
set background=dark
" colorscheme solarized
let g:solarized_termcolors=256

" 基本設定
set number " 行番号
set title " titleをバッファ名にする 
set showmatch " 対応したかっこのハイライト
set t_Co=256 " 256色表示
set autoread " 内容変更時に自動読み込み
set noswapfile " swapfileを作らない
set formatoptions-=c " フォーマット揃えをコメント以外有効にする 

" 自動インデント
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" tab関連
set expandtab 
set tabstop=2
set shiftwidth=2

" 検索関連
set ignorecase " 大文字小文字を区別しない
set smartcase " 大文字で検索されたら大文字のみ
set wrapscan " 行末まで検索したら行頭に戻る
set hlsearch " 検索結果をハイライトする

set ambiwidth=double " unicodeで行末がへんになる問題に対処
set hidden " ファイルが保存されていなくても別ファイルを開けるように
set history=50 " コマンドの履歴をn件保存
set virtualedit=block " 矩形選択時、行末よりも後ろにカーソルを置ける
set backspace=indent,eol,start " backspaceで行頭を削除
set wildmenu
