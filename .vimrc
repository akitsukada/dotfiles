"------------------------------------
"  BasicSettings
"------------------------------------
colorscheme koehler
syntax on
set nocompatible
set smartindent
set smarttab
set smartcase
set ignorecase
set number
set hlsearch
set enc=utf-8                             " 文字コード
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set showtabline=2                         " タブを常に表示
set laststatus=2                          " ステータスラインを表示
set clipboard+=unnamed                    " VimバッファをOSクリップボードと共有
"" ステータスラインの表示内容
set statusline=%{expand('%:p:t')}\ %<\(%{SnipMid(expand('%:p:h'),80-len(expand('%:p:t')),'...')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]
"" 検索語が画面中央にくるように
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"------------------------------------
"  pathogen
"------------------------------------
" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off
" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
" ファイルタイプ判定をon
filetype on
filetype plugin on
filetype indent on

"------------------------------------
"  edit tab settings
"------------------------------------
"" 共通設定
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
"" タイプ別設定は.vim/indent/

"------------------------------------
"  現在位置のハイライト
"------------------------------------
" カーソル行/列をハイライト
set cursorline
"set cursorcolumn
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
" ハイライトをかっこよく
"highlight CursorLine ctermfg=NONE ctermbg=darkgray cterm=NONE
highlight CursorLine ctermfg=NONE ctermbg=darkgray cterm=NONE
"highlight CursorColumn ctermfg=NONE ctermbg=darkgray cterm=NONE

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

"------------------------------------
"  keymap
"------------------------------------
"" change tabpage
"" C-← → を使いたいときは、一旦制御文字をvim用のマッピングに変更する
"map [5D <C-Right>
"map [5C <C-Left>
" コントロール＋NPでタブ移動
nnoremap <C-N> gt
nnoremap <C-P> gT
"" CTRL-hjklでsplitウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"" reload vimrc
nmap ;s :source ~/.vimrc<CR>
"" edit vimrc
nmap ;v :tabe ~/.vimrc<CR>
"" omni補完とか
setlocal omnifunc=syntaxcomplete#Complete

"" ファイルを開いたときに前回の編集箇所に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"------------------------------------
"  数字の上で<C-i> ⇨ 縦に連番をふる
"------------------------------------
nnoremap <C-i> qayyp<C-a>q@a

"------------------------------------
"  vim-ref
"------------------------------------
let g:ref_phpmanual_path = '~/.vim/bundle/vim-ref/manuals/phpmanuals'

"------------------------------------
"  for makefile
"------------------------------------
autocmd FileType make setlocal noexpandtab

""------------------------------------
""  for rails
""------------------------------------
"" insert magic comment
imap <C-c> # -*- coding:UTF-8 -*-
nmap <C-c> ggO# -*- coding:UTF-8 -*-<ESC>
"" shortcuts for edit rails
imap <C-e> <%=  %><left><left><left>
imap <C-r> <%  %><left><left><left>
imap <C-w> #{}<left>
"" when open new (*.rb|*.erb) file, insert magic comment automatically
autocmd BufNewFile *.rb,*.erb 0r ~/.vim/templates/rb.tpl
autocmd BufNewFile,BufRead *.erb set filetype=html

"------------------------------------
"  for js
"------------------------------------
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS

"------------------------------------
"  functions
"------------------------------------
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

