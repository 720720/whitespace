if exists('g:loaded_whitespace') || &compatible
  finish
endif
let g:loaded_whitespace = 1

let g:whitespace_show = get(g:, 'whitespace_show', 1)
let g:whitespace_trim = get(g:, 'whitespace_trim', 1)
let g:whitespace_skip = get(g:, 'whitespace_skip', ['markdown'])
let g:whitespace_code = get(g:, 'whitespace_code', '[\U0009\U0020\U00A0\U1680\U2000-\U200A\U202F\U205F\U3000]')

command -range=% Trim call whitespace#trim(<line1>, <line2>)

function! whitespace#trim(line1, line2)
  let l:view = winsaveview()
  execute 'keeppatterns' . a:line1 . ',' . a:line2 . 's/' . g:whitespace_code . '\+$//e'
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
    execute 'match Error /' . g:whitespace_code . '\+\%#\@<!$/'
  endif
endfunction

function! whitespace#insertleave()
  if g:whitespace_show == 1
    execute 'match Error /' . g:whitespace_code . '\+$/'
  endif
endfunction
