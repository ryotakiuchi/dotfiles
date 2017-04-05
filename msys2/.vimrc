set number " 行番号
set title " titleをバッファ名にする 
set showmatch " 対応したかっこのハイライト
set t_Co=256 " 256色表示
set autoread " 内容変更時に自動読み込み
set noswapfile " swapfileを作らない
set formatoptions-=c " フォーマット揃えをコメント以外有効にする 

" 自動インデント
set smartindent
set autoindent

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

" 自動文字数カウント
augroup WordCount
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
    if a:0 == 0
        return s:WordCountStr
    endif
    let cidx = 3
    silent! let cidx = s:WordCountDict[a:1]
    let s:WordCountStr = ''
    let s:saved_status = v:statusmsg
    exec "silent normal! g\<c-g>"
    if v:statusmsg !~ '^--'
        let str = ''
        silent! let str = split(v:statusmsg, ';')[cidx]
        let cur = str2nr(matchstr(str, '\d\+'))
        let end = str2nr(matchstr(str, '\d\+\s*$'))
        if a:1 == 'char'
            " ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
            let cr = &ff == 'dos' ? 2 : 1
            let cur -= cr * (line('.') - 1)
            let end -= cr * line('$')
        endif
        let s:WordCountStr = printf('%d/%d', cur, end)
    endif
    let v:statusmsg = s:saved_status
    return s:WordCountStr
endfunction

source $VIMRUNTIME/macros/matchit.vim
let b:match_words = "if:endif,foreach:endforeach,\<begin\>:\<end\>"

" syntax highlight
syntax enable
set background=dark
colorscheme solarized

" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
