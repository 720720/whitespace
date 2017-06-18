if exists('g:loaded_whitespace') || &compatible
  finish
endif
let g:loaded_whitespace = 1

let g:whitespace_show = get(g:, 'whitespace_show', 1)
let g:whitespace_trim = get(g:, 'whitespace_trim', 1)
let g:whitespace_skip = get(g:, 'whitespace_skip', ['markdown'])
let g:whitespace_code = get(g:, 'whitespace_code', '[\U000B\U000C\U0085\U00A0\U00AD\U034F\U061C\U115F\U1160\U1680\U17B4\U17B5\U180B-\U180E\U2000-\U200F\U2028\U2029\U202A-\U202F\U205F-\U206F\U3000\U3164\UFE00-\UFEFF\UFFA0\UFFF0-\UFFF8\U1BCA0-\U1BCA3\U1D173-\U1D17A\UE0000-\UE0FFF]')

command -range=% Trim call whitespace#trim(<line1>, <line2>)

function! whitespace#trim(line1, line2)
  let l:view = winsaveview()
  execute 'keeppatterns' . a:line1 . ',' . a:line2 . 's/\s\+$\|' . g:whitespace_code . '\+//ge'
  call winrestview(l:view)
endfunction

augroup whitespace
  autocmd!
  autocmd BufWritePre * call whitespace#bufwritepre()
  autocmd InsertEnter * call whitespace#insertenter()
  autocmd InsertLeave,BufRead,WinEnter * call whitespace#insertleave()
augroup END

function! whitespace#bufwritepre()
  if g:whitespace_trim == 1 && index(g:whitespace_skip, &filetype) < 0
    call whitespace#trim(0, line('$'))
  endif
endfunction

function! whitespace#insertenter()
  if g:whitespace_show == 1
    execute 'match Error /\s\+\%#\@<!$\|' . g:whitespace_code . '\+/'
  endif
endfunction

function! whitespace#insertleave()
  if g:whitespace_show == 1
    execute 'match Error /\s\+$\|' . g:whitespace_code . '\+/'
  endif
endfunction
