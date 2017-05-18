" dein.vim
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

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

" syntax highlight
syntax enable
set background=dark
set t_Co=256
colorscheme solarized

