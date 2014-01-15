"=============================================================================
" File    : /.vim/autoload/unite/sources/outline/lisp.vim
" Author  : ytsunetsune
"=============================================================================

function! unite#sources#outline#lisp#outline_info()
  return s:outline_info
endfunction

let s:outline_info = {
      \ 'heading' : '^\s*(defmethod.\+\|^\s*(defun.\+\|^\s*(defclass.\+\|^\s*(:.\+\|^\s*(defmacro.\+',
      \ }

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  let level = 1
  if a:heading_line =~ '^\s*(:.\+'
    let level = 2
  endif
  let heading = {
        \ 'word' : a:heading_line,
        \ 'level': level,
        \ 'type' : 'generic',
        \ }
  return heading
endfunction

