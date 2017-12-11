 _   ________  ___  _      ____ _______________________  ___  _________
| | / /  _/  |/  / | | /| / / // /  _/_  __/ __/ __/ _ \/ _ |/ ___/ __/
| |/ // // /|_/ /  | |/ |/ / _  // /  / / / _/_\ \/ ___/ __ / /__/ _/
|___/___/_/  /_/   |__/|__/_//_/___/ /_/ /___/___/_/  /_/ |_\___/___/



WHITESPACE

https://en.wikipedia.org/wiki/Whitespace_character
https://de.wikipedia.org/wiki/Leerraum
https://en.wikipedia.org/wiki/Unicode_character_property
https://de.wikipedia.org/wiki/Liste_der_Unicode-Eigenschaften

https://unicode.org
https://unicode.org/L2/L2002/02368-default-ignorable.pdf



CODE POINTS

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

https://stackoverflow.com/questions/13435586/should-i-use-single-or-double-quotes-in-my-vimrc-file



CODE


if exists('g:loaded_whitespace') || &compatible
  finish
endif
let g:loaded_whitespace = 1

http://vim.wikia.com/wiki/How_to_write_a_plugin
http://vimhelp.appspot.com/eval.txt.html#exists%28%29
http://vimhelp.appspot.com/options.txt.html#%27compatible%27
http://vimhelp.appspot.com/repeat.txt.html#%3Afinish



let g:whitespace_show = get(g:, 'whitespace_show', 1)
let g:whitespace_wipe = get(g:, 'whitespace_wipe', 1)
let g:whitespace_skip = get(g:, 'whitespace_skip', ['markdown'])
let g:whitespace_melt = get(g:, 'whitespace_melt', '\s')
let g:whitespace_burn = get(g:, 'whitespace_burn', '[\U000B\U000C\U0085\U00A0\U00AD\U034F\U061C\U115F\U1160\U1680\U17B4\U17B5\U180B-\U180E\U2000-\U200F\U2028\U2029\U202A-\U202F\U205F-\U206F\U3000\U3164\UFE00-\UFEFF\UFFA0\UFFF0-\UFFF8\U1BCA0-\U1BCA3\U1D173-\U1D17A\UE0000-\UE0FFF]')

https://stackoverflow.com/questions/15309218/vim-where-to-put-default-values-for-plugin-variables
http://vimhelp.appspot.com/eval.txt.html#get%28%29



command -range=% Wipe call whitespace#wipe(<line1>, <line2>)

http://vimhelp.appspot.com/usr_40.txt.html#40.2
http://vimhelp.appspot.com/eval.txt.html#%3Acall
http://vimhelp.appspot.com/eval.txt.html#%3Afunction



function! whitespace#wipe(line1, line2)
  let l:view = winsaveview()
  execute 'keeppatterns' . a:line1 . ',' . a:line2 . 's/' . g:whitespace_melt . '\+$\|' . g:whitespace_burn . '\+//ge'
  call winrestview(l:view)
endfunction

http://vimhelp.appspot.com/eval.txt.html#user-functions
http://vimhelp.appspot.com/eval.txt.html#winsaveview%28%29
http://vimhelp.appspot.com/eval.txt.html#winrestview%28%29
http://vimhelp.appspot.com/eval.txt.html#%3Aexecute
http://vimhelp.appspot.com/cmdline.txt.html#%3Akeeppatterns


a:line1 . ',' . a:line2 . 's/'

http://vim.wikia.com/wiki/Highlight_unwanted_spaces
http://vim.wikia.com/wiki/Search_and_replace
http://vimhelp.appspot.com/change.txt.html#%3Asubstitute


/\s\+$

http://vimhelp.appspot.com/pattern.txt.html#%2F%5Cs
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B
http://vimhelp.appspot.com/pattern.txt.html#%2F%24


/[\U000B\U000C\U0085]\+

http://vimhelp.appspot.com/pattern.txt.html#%2Fcollection
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%25U
http://vimhelp.appspot.com/pattern.txt.html#%2F%5C%2B


\|

http://vimhelp.appspot.com/pattern.txt.html#%2Fpattern


/{string}/

http://vimhelp.appspot.com/change.txt.html#%3Asubstitute


ge

http://vimhelp.appspot.com/change.txt.html#%3As_flags


