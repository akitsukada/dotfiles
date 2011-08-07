if exists('b:did_indent')
  finish
endif

setlocal smartindent
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

let b:undo_indent = 'setlocal '.join([
      \   'smartindent<',
      \   'expandtab<',
      \   'shiftwidth<',
      \   'softtabstop<',
      \   'tabstop<',
      \ ])

let b:did_indent = 1
