if exists('g:whitespace_loaded') || &compatible
  finish
endif
let g:whitespace_loaded = 1

let g:whitespace_chars = get(g:, 'whitespace_chars', '[\u0009\u0020\u00A0\u1680\u2000-\u200A\u202F\u205F\u3000]')
let g:whitespace_show = get(g:, 'whitespace_show', 1)
let g:whitespace_strip = get(g:, 'whitespace_strip', 1)

highlight whitespace ctermbg=red guibg=red

if g:whitespace_show == 1
  execute 'match whitespace /' . g:whitespace_chars . '\+\%#\@<!$/'
endif

function! whitespace#strip(line1,line2)
  let _s=@/
  let l = line('.')
  let c = col('.')
  execute a:line1 . ',' . a:line2 . 's/' . g:whitespace_chars . '\+$//e'
  let @/=_s
  call cursor(l, c)
endfunction

if g:whitespace_strip == 1
  augroup whitespace
    autocmd!
    autocmd BufWritePre * call whitespace#strip(0, line('$'))
  augroup END
endif

command -range=% WhitespaceStrip call whitespace#strip(<line1>,<line2>)
