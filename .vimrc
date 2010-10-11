syntax on

colorscheme koehler

set nocompatible
set expandtab
set number
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smartindent
set ignorecase
"set list
set showcmd
set laststatus=2
"set title
set statusline=%{expand('%:p:t')}\ %<\(%{SnipMid(expand('%:p:h'),80-len(expand('%:p:t')),'...')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]
set wrapscan
set scrolloff=10
set showmatch matchtime=3
set hlsearch
set wildmode=list:longest

" ステータスラインの色
highlight Statuslign term=NONE cterm=NONE ctermfg=black ctermfg=white

" for php
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
let php_folding = 1
"let php_noShortTags = 1
let php_htmlInStrings = 1
au Syntax php set fdm=syntax
set foldlevel=1

source $VIMRUNTIME/macros/matchit.vim

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

"mapping
"" map
map <C-n> gt
map <C-p> gT
"" nmap
""" キーワード補完
imap <C-f> <C-x><C-o>
""" 後方検索補完
"imap <C-n> <C-x><C-n>
""" 前方検索補完
"imap <C-p> <C-x><C-p>
""" 日付/時刻/サイン挿入
imap <silent> <C-d><C-d> <C-R>=strftime("%Y/%b/%d (%a)")<CR>
imap <silent> <C-t><C-t> <C-R>=strftime("%H:%M:%S")<CR>
imap <silent> <C-d><C-t> <C-R>=strftime("%Y/%b/%d (%a) %H:%M:%S")<CR>
imap <silent> <C-e><C-e> <C-R>=strftime("%Y/%b/%d (%a) %H:%M:%S by Akihiro Tsukada.")<CR>
"imap <C-k> aaa
"imap <C-l> bbb
"" vmap
vmap <BS> x

" omni補完
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType make setlocal noexpandtab

filetype plugin on
filetype indent on

" C-c, C-v でクリップボードにコピー、はりつけ
nnoremap <silent><C-c> :.w !pbcopy<CR><CR>
vnoremap <silent><C-c> :w !pbcopy<CR><CR>
nnoremap <silent><C-v> :r !pbpaste<CR><CR>
vnoremap <silent><C-v> :r !pbpaste<CR><CR>
inoremap <silent><C-v> <Esc>:r !pbpaste<CR><CR>i 

let g:neocomplcache_enable_at_startup = 1
