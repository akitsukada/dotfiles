" Vundle {{{

filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

" 利用中のプラグインをBundle
" github repos
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'kana/vim-fakeclip'
" vim-scripts repos
Bundle 'rails.vim'
Bundle 'svn-diff.vim'
Bundle 'vim-ruby'

" non github repos
filetype plugin indent on
" }}}

" BasicSettings {{{

syntax on
colorscheme desert
set nocompatible
set smartindent
set smarttab
set smartcase
set ignorecase

" これら以外の言語固有tab設定は~/.vim/indent/$lang.vim
"set expandtab
set tabstop=2     " ファイル中のタブ文字の表示幅
set shiftwidth=2  " 自動で挿入されるインデント幅
set softtabstop=2 " タブ押下時に挿入されるスペース数

set number
set hlsearch
set enc=utf-8                             " 文字コード
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set showtabline=2                         " タブを常に表示
set laststatus=2                          " ステータスラインを表示
set clipboard+=unnamed                    " VimバッファをOSクリップボードと共有
set noswapfile
set wildmenu

" TABと行末spaceの可視化
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" ステータスラインの表示内容
set statusline=%{expand('%:p:t')}\ %<\(%{SnipMid(expand('%:p:h'),80-len(expand('%:p:t')),'...')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]

" 検索語が画面中央にくるように
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" indent
vnoremap + !~/.vim/indent/indent-equal.rb<cr>

"" 保存時に行末の空白を除去する // 勝手にやられるとdiffがひどいことになったりするので停止
"autocmd BufWritePre * :%s/\s\+$//ge
""}}}

" php {{{
let php_folding = 1
let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
"}}}

"  現在位置のハイライト {{{

" カーソル行/列をハイライト
"set cursorline
" カレントペインのみハイライト
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END
"" ハイライトをかっこよく
"" TODO
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray
"}}}

"  全角スペースのハイライト {{{

function! JISX0208SpaceHilight()
  syntax match JISX0208Space "　" display containedin=ALL
  highlight JISX0208Space term=underline ctermbg=LightCyan
endf
"}}}

" keymap {{{

"" change tabpage
"" C-← → を使いたいときは、一旦制御文字をvim用のマッピングに変更する
"map [5D <C-Right>
"map [5C <C-Left>
"
" コントロール＋NPでタブ移動
nnoremap <C-N> gt
nnoremap <C-P> gT

"" CTRL-hjklでsplitウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"" reload vimrc
nnoremap ;s :source $MYVIMRC<CR>
"" edit vimrc
nnoremap ;v :tabe $MYVIMRC<CR>

"" ファイルを開いたときに前回の編集箇所に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"" for ruby
inoremap <C-r> #!/usr/bin/env ruby
inoremap <C-c> # -*- coding:UTF-8 -*-

" gf時に新しいタブで
nnoremap gf :tabe <cfile><cr>
"}}}

" マクロ {{{

"  数字の上で<C-i> ⇨ 縦に連番をふる
nnoremap <C-i> qayyp<C-a>q@a
" 日付挿入
"yyyy/mm/dd
inoremap <c-d><c-d> <c-r>=strftime("%Y/%m/%d")<cr>
inoremap <c-d><c-t> <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
inoremap <c-t><c-t> <c-r>=strftime("%H:%M:%S")<cr>
"}}}

" neocomplcache {{{

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
"}}}

" functions {{{

function! SnipMid(str, len, mask)
  if a:len >= len(a:str)
    return a:str
  elseif a:len <= len(a:mask)
    return a:mask
  endif
  let len_head = (a:len - len(a:mask)) / 2
  let len_tail = a:len - len(a:mask) - len_head
  return (len_head > 0 ? a:str[: len_head - 1] : '') . a:mask . (len_tail > 0 ? a:str[-len_tail :] : '')
endfunction

function! HandleURI() " \w でカーソル下のURL開く
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

map <Leader>w :call HandleURI()<CR>
"}}}

" fold {{{

set foldenable
set foldmethod=marker
set foldcolumn=3
set foldlevel=0
set foldopen=hor,search
"set foldclose=all
set foldminlines=2
"}}}

" Align {{{
let g:Align_xstrlen=3
"}}}
