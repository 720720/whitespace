if exists('g:loaded_whitespace') || &compatible
  finish
endif
let g:loaded_whitespace = 1

let g:whitespace_show = get(g:, 'whitespace_show', 1)
let g:whitespace_wipe = get(g:, 'whitespace_wipe', 1)
let g:whitespace_skip = get(g:, 'whitespace_skip', ['markdown'])
let g:whitespace_melt = get(g:, 'whitespace_melt', '\s')
let g:whitespace_burn = get(g:, 'whitespace_burn', '[\U000B\U000C\U0085\U00A0\U00AD\U034F\U061C\U115F\U1160\U1680\U17B4\U17B5\U180B-\U180E\U2000-\U200F\U2028\U2029\U202A-\U202F\U205F-\U206F\U3000\U3164\UFE00-\UFEFF\UFFA0\UFFF0-\UFFF8\U1BCA0-\U1BCA3\U1D173-\U1D17A\UE0000-\UE0FFF]')

command -range=% Wipe call whitespace#wipe(<line1>, <line2>)

function! whitespace#wipe(line1, line2)
  let l:view = winsaveview()
  execute 'keeppatterns' . a:line1 . ',' . a:line2 . 's/' . g:whitespace_melt . '\+$\|' . g:whitespace_burn . '\+//ge'
  call winrestview(l:view)
endfunction

augroup whitespace
  autocmd!
  autocmd BufWritePre * call whitespace#bufwritepre()
  autocmd InsertEnter * call whitespace#insertenter()
  autocmd InsertLeave,BufRead,WinEnter * call whitespace#insertleave()
augroup END

function! whitespace#bufwritepre()
  if g:whitespace_wipe == 1 && index(g:whitespace_skip, &filetype) < 0
    call whitespace#wipe(0, line('$'))
  endif
endfunction

function! whitespace#insertenter()
  if g:whitespace_show == 1
    execute 'match Error /' . g:whitespace_melt . '\+\%#\@<!$\|' . g:whitespace_burn . '\+/'
  endif
endfunction

function! whitespace#insertleave()
  if g:whitespace_show == 1
    execute 'match Error /' . g:whitespace_melt . '\+$\|' . g:whitespace_burn . '\+/'
  endif
endfunction
