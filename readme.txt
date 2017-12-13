 _   ________  ___  _      ____ _______________________  ___  _________
| | / /  _/  |/  / | | /| / / // /  _/_  __/ __/ __/ _ \/ _ |/ ___/ __/
| |/ // // /|_/ /  | |/ |/ / _  // /  / / / _/_\ \/ ___/ __ / /__/ _/
|___/___/_/  /_/   |__/|__/_//_/___/ /_/ /___/___/_/  /_/ |_\___/___/



WHITESPACE

https://blog.codinghorror.com/whitespace-the-silent-killer/

https://en.wikipedia.org/wiki/Whitespace_character
https://de.wikipedia.org/wiki/Leerraum
https://en.wikipedia.org/wiki/Unicode_character_property
https://de.wikipedia.org/wiki/Liste_der_Unicode-Eigenschaften

https://unicode.org
https://unicode.org/L2/L2002/02368-default-ignorable.pdf



UNICODE

http://unicode.org/cldr/utility/list-unicodeset.jsp?a=[:White_Space=Yes:]
http://unicode.org/cldr/utility/list-unicodeset.jsp?a=[:Default_Ignorable_Code_Point=Yes:]

U+0009 CHARACTER TABULATION
U+000A LINE FEED (LF)
U+000D CARRIAGE RETURN (CR)
U+0020 SPACE

[\U000B\U000C\U0085\U00A0\U00AD\U034F\U061C\U115F\U1160\U1680\U17B4\U17B5\U180B-\U180E\U2000-\U200F\U2028\U2029\U202A-\U202F\U205F-\U206F\U3000\U3164\UFE00-\UFEFF\UFFA0\UFFF0-\UFFF8\U1BCA0-\U1BCA3\U1D173-\U1D17A\UE0000-\UE0FFF]



VIMSCRIPT

http://learnvimscriptthehardway.stevelosh.com/
https://devhints.io/vimscript

https://google.github.io/styleguide/vimscriptguide.xml
https://google.github.io/styleguide/vimscriptfull.xml



LINKS

http://vim.wikia.com/wiki/Highlight_unwanted_spaces
http://vim.wikia.com/wiki/Remove_unwanted_spaces
http://vim.wikia.com/wiki/Search_and_replace

https://superuser.com/questions/921920/display-trailing-spaces-in-vim
https://www.guyrutenberg.com/2013/12/07/highlight-whitespace-at-end-of-line-in-vim/

http://vimcasts.org/episodes/tidying-whitespace/
http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html

https://www.reddit.com/r/vim/comments/29lunc/is_there_such_a_thing_as_a_sideeffect_free_macro/
https://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/



PLUGINS

https://vimawesome.com/?q=whitespace
https://github.com/search?l=Vim+script&o=desc&q=whitespace&s=stars&type=Repositories&utf8=%E2%9C%93
https://github.com/ntpeters/vim-better-whitespace



HELP

http://vimhelp.appspot.com/

http://vimhelp.appspot.com/eval.txt.html#functions
http://vimhelp.appspot.com/eval.txt.html#internal-variables



CODE

if exists('g:loaded_whitespace') || &compatible
  finish
endif
let g:loaded_whitespace = 1

http://vim.wikia.com/wiki/How_to_write_a_plugin
http://vimhelp.appspot.com/eval.txt.html#exists%28%29
http://vimhelp.appspot.com/options.txt.html#%27compatible%27
http://vimhelp.appspot.com/repeat.txt.html#%3Afinish
https://stackoverflow.com/questions/13435586/should-i-use-single-or-double-quotes-in-my-vimrc-file



let g:whitespace_show = get(g:, 'whitespace_show', 1)
let g:whitespace_wipe = get(g:, 'whitespace_wipe', 1)
let g:whitespace_skip = get(g:, 'whitespace_skip', ['markdown'])
let g:whitespace_melt = get(g:, 'whitespace_melt', '\s')
let g:whitespace_burn = get(g:, 'whitespace_burn', '[\U000B\U000C\U0085\U00A0\U00AD\U034F\U061C\U115F\U1160\U1680\U17B4\U17B5\U180B-\U180E\U2000-\U200F\U2028\U2029\U202A-\U202F\U205F-\U206F\U3000\U3164\UFE00-\UFEFF\UFFA0\UFFF0-\UFFF8\U1BCA0-\U1BCA3\U1D173-\U1D17A\UE0000-\UE0FFF]')

https://stackoverflow.com/questions/15309218/vim-where-to-put-default-values-for-plugin-variables
http://vimhelp.appspot.com/eval.txt.html#get%28%29



command -range=% Wipe call whitespace#wipe(<line1>, <line2>)

http://vimhelp.appspot.com/usr_40.txt.html#40.2
http://vimhelp.appspot.com/map.txt.html#user-commands
http://vimhelp.appspot.com/map.txt.html#%3Acommand-range
http://vimhelp.appspot.com/map.txt.html#%3Cline1%3E
http://vimhelp.appspot.com/map.txt.html#%3Cline2%3E
http://vimhelp.appspot.com/map.txt.html#%3Cmods%3E

http://vimhelp.appspot.com/eval.txt.html#%3Acall
http://vimhelp.appspot.com/eval.txt.html#%3Afunction
https://stackoverflow.com/questions/18178768/vimscript-call-vs-execute



function! whitespace#wipe(line1, line2)
  let l:view = winsaveview()
  execute 'keeppatterns' . a:line1 . ',' . a:line2 . 's/' . g:whitespace_melt . '\+$\|' . g:whitespace_burn . '\+//ge'
  call winrestview(l:view)
endfunction

http://vimhelp.appspot.com/eval.txt.html#user-functions
http://vimhelp.appspot.com/eval.txt.html#winsaveview%28%29
http://vimhelp.appspot.com/eval.txt.html#winrestview%28%29
https://stackoverflow.com/questions/19762869/how-do-i-save-the-current-cursor-position-and-load-it-later-in-vimscript
https://vi.stackexchange.com/questions/6036/how-to-save-previous-cursor-position-inside-a-function-which-has-received-a-rang


execute 'keeppatterns' a:line1 . ',' . a:line2 . 's/\s\+$\|[\U000B\U000C\U0085]\+//ge'

http://vimhelp.appspot.com/eval.txt.html#%3Aexecute
https://vi.stackexchange.com/questions/9644/how-to-use-a-variable-in-the-expression-of-a-normal-command

http://vimhelp.appspot.com/cmdline.txt.html#%3Akeeppatterns
http://vimhelp.appspot.com/change.txt.html#%3Asubstitute      :[range]s[ubstitute]/{pattern}/{string}/[flags] [count]

http://vimhelp.appspot.com/usr_10.txt.html#10.3
http://vimhelp.appspot.com/cmdline.txt.html#cmdline-ranges    % equal to 1,$ (the entire file)


/\s\+$
trailing whitespace

http://vimhelp.appspot.com/pattern.txt.html#%2F%5Cs           /\s
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B         /\+
http://vimhelp.appspot.com/pattern.txt.html#%2F%24            /$


/[\U000B\U000C\U0085]\+
1 or more unicode characters

http://vimhelp.appspot.com/pattern.txt.html#%2F%5B%5D         /[]
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%25U        /\%U
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B         /\+


\|
or

http://vimhelp.appspot.com/pattern.txt.html#%2Fpattern        \|


/{string}/
replace a match of {pattern} with {string}

http://vimhelp.appspot.com/change.txt.html#%3Asubstitute      //


ge
replace all occurrences in the line
do not issue an error message

http://vimhelp.appspot.com/change.txt.html#%3As_flags         ge



function! whitespace#bufwritepre()
  if g:whitespace_wipe == 1 && index(g:whitespace_skip, &filetype) < 0
    call whitespace#wipe(1, '$')
  endif
endfunction

http://vimhelp.appspot.com/filetype.txt.html
http://vimhelp.appspot.com/eval.txt.html#index%28%29
http://vimhelp.appspot.com/eval.txt.html#line%28%29



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

http://vimhelp.appspot.com/pattern.txt.html#match-highlight   :mat[ch] {group} /{pattern}/


/\s\+\%#\@<!$
trailing whitespace except when typing at the end of a line

http://vimhelp.appspot.com/pattern.txt.html#%2F%5Cs           /\s
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B         /\+
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%25%23      /\%#
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%40%3C%21   /\@<!
http://vimhelp.appspot.com/pattern.txt.html#%2F%24            /$


/\s\+$
trailing whitespace

http://vimhelp.appspot.com/pattern.txt.html#%2F%5Cs           /\s
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B         /\+
http://vimhelp.appspot.com/pattern.txt.html#%2F%24            /$


/[\U000B\U000C\U0085]\+
1 or more unicode characters

http://vimhelp.appspot.com/pattern.txt.html#%2F%5B%5D         /[]
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%25U        /\%U
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B         /\+


\|
or

http://vimhelp.appspot.com/pattern.txt.html#%2Fpattern        \|



augroup whitespace
  autocmd!
  autocmd BufWritePre * call whitespace#bufwritepre()
  autocmd InsertEnter * call whitespace#insertenter()
  autocmd InsertLeave,BufRead,WinEnter * call whitespace#insertleave()
augroup END

http://vimhelp.appspot.com/autocmd.txt.html
http://vimhelp.appspot.com/eval.txt.html#%3Acall


