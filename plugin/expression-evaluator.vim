" Maintainer: Steven Hall

if exists('g:expression-evaluator#loaded')
  finish
endif
let g:expression_evaluator#loaded = 1

" Calculate Math
function! s:visual_math()
  " Save contents of register z
  let l:reg_z = @z

  " re-select the visual selection, and copy it into register z
  exec 'normal! gv"zy'

  " Assign the content of register z to the expression register (I couldn't seem
  " to copy the visual selection directly into the expression register, so this
  " was the next best way)
  let @= = @z

  " Restore the content of register z
  let @z = l:reg_z

  " Go to the end of the visual selection, add an equals sign, and paste the
  " evaluated expression from the expression register
  exec "normal! `>a=\<c-r>=\<cr>"
endfunction

" While I am here, may as well add some math variables and functions that I can
" use
function! Pi()
  return 3.14159265359
endfunction

function! E()
  return 2.71828182846
endfunction

" Convert Radians to degrees
function! Deg(rad)
  return a:rad * 180 / Pi()
endfunction

" Convert degrees to radians
function! Rad(deg)
  return a:deg * Pi() / 180
endfunction

" Convert degrees to radians
function! Area_circle(radius)
  return a:radius * a:radius * Pi()
endfunction

" Convert degrees to radians
function! Perim_circle(radius)
  return 2 * a:radius * Pi()
endfunction

xnoremap <silent> <Plug>ExpressionEvaluatorVisual <esc>:call <SID>visual_math()<cr>
nnoremap <silent> <Plug>ExpressionEvaluatorNormal :let @= = getline('.')<cr>A=<c-r>=<cr><esc>

" Same as other visual mapping, but this one deletes the expression and leaves
" only the answer
xnoremap <silent> <Plug>ExpressionEvaluatorAnswerOnlyVisual <esc>:call <SID>visual_math()<cr>gvdx
nnoremap <silent> <Plug>ExpressionEvaluatorAnswerOnlyNormal :let @= = getline('.')<cr>A=<c-r>=<cr><esc>0df=
