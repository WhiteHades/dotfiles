# keybindings

## contents

1. [tmux](#tmux)
2. [fzf](#fzf)
3. [neovim](#neovim)
4. [opencode](#opencode)
5. [hyprland](#hyprland)

## tmux

0. `ctrl + a`: prefix
1. `prefix + r` : reload tmux configuration file
2. `prefix + \ / -` : split pane horizontally / vertically
3. `prefix + c / :new` : create new window / session
4. `prefix + , / $` : rename current window / session
5. `prefix + n / p` : move to next / previous window
6. `prefix + 0..9` : move to window by number
7. `prefix + w / s` : list and choose window / session
8. `prefix + d` : detach from current session
9. `prefix + h/j/k/l` : resize current pane (direction)
10. `prefix + m` : toggle maximizing current pane
11. `ctrl + h/j/k/l` : move focus between panes
12. `prefix + ctrl + s / r` : save / restore session state

## fzf

1. `ctrl + t` : fuzzy find files in current directory
2. `ctrl + r` : fuzzy search command history
3. `alt + c` : fuzzy find and change into a subdirectory
4. `ff` : custom alias to fuzzy find files with preview
5. `fo` : custom alias to fuzzy find and open with xdg-open or nvim
6. `fn` : custom alias to fuzzy find and open in nvim

## neovim

**markers**: [++]=favorite [+]=often [-]=rarely [!]=custom

### navigation

1. `N: I/A` : **I**nsert at start / **A**ppend at end of line + insert mode
2. `N: $/^/0` : end of line / start of text (^=caret) / column zero
3. `N: ctrl + u/d` : page **u**p/**d**own half screen (cursor locked)
4. `N: ctrl + f/b` : page **f**orward/**b**ackward full screen (also scroll file picker)
5. `N: zt/zb/zz` : move current line to **t**op/**b**ottom/center (z-commands)
6. `N: e/be` : **e**nd of current/next word / **b**ack + **e**nd of word
7. `N: w/b` : next **w**ord / **b**ack word
8. `N: <n>G` : **G**o to line n (capital G = go)
9. `N: gg/G` : go top / **G**o bottom of file
10. `N: ctrl + o/i` : jump **o**lder/**i**nward (back/forward in jump list)
11. `N: space + space` : file picker

### navigation - sentences & paragraphs

12. `N: (/)` : prev/next **s**entence (stops at ./!/? + space or blank lines) [-]
13. `N: {/}` : prev/next **p**aragraph (blank line = boundary) [+]

### navigation - unimpaired mode ([ and ])

14. `N: [(/](` : jump to prev/next unmatched **(**opening paren (**jump out** of nested parens)
15. `N: [{/]}` : jump to prev/next unmatched **{** opening/closing brace (**jump out** of block)
16. `N: [</]>` : jump to prev/next unmatched **<** opening/closing angle bracket
17. `N: [%/]%` : jump to start/end of **any** enclosing bracket (paren/brace/angle/square)
18. `N: [[/]]` : prev/next **reference** to variable under cursor (LSP-aware, auto-highlights)
19. `N: [c/]c` : prev/next **c**lass start, `[C/]C` for end [-]
20. `N: [f/]f` : prev/next **f**unction start, `[F/]F` for end [-]
21. `N: [m/]m` : prev/next **m**ethod start, `[M/]M` for end [-]
22. `N: [i/]i` : jump to top/bottom of current **i**ndentation level (visual guides) [+]
23. `N: [d/]d` : prev/next **d**iagnostic (errors/warnings/hints combined)
24. `N: [e/]e` : prev/next **e**rror only
25. `N: [w/]w` : prev/next **w**arning only
26. `N: [s/]s` : prev/next **s**pelling error (not `]d` for misspellings!)
27. `N: [t/]t` : prev/next **t**odo/FIXME comment
28. `N: [h/]h` : prev/next git **h**unk (unstaged/uncommitted changes, visual indicators) [++]
29. `N: %` : jump to matching bracket/paren (works when cursor on bracket char)

### editing - delete

30. `N: d<motion>` : **d**elete text from cursor to motion (`dw`=word, `d$`=to-end, `dt=`=**t**ill =)
31. `N: dd/D` : **d**elete entire line / **D**elete to line end (double-d = line)
32. `N: x/X` : e**x**terminate char under/before cursor
33. `N: <n>x` : delete n chars (e.g. `5x`)

### editing - change

34. `N: c<motion>` : **c**hange (delete + insert) text from cursor to motion (`cw`=word, `ciw`=**i**nner word)
35. `N: cc/C` : **c**hange entire line / **C**hange to line end (double-c = line)
36. `N: r<char>` : **r**eplace single char under cursor

### editing - text manipulation

37. `N: J/gJ` : **J**oin lines (with/without space, g=no-space)
38. `N: gU<motion>` : **g**o **U**ppercase text from cursor to motion (`gUiw`=word)
39. `N: gu<motion>` : **g**o **u**ppercase (lowercase) text from cursor to motion (`guiw`=word)
40. `N: gUU/guu` : uppercase/lowercase entire line (double = line)
41. `N: ~` : **~** tilde = toggle case of char

### editing - text objects

**grammar**: `<verb><context><object>` where context is `a`=**a**round (includes delimiter) or `i`=**i**nside (excludes delimiter)

42. `N: <verb>iw/aw` : **i**nner/**a**round **w**ord (`diw`=delete word, `daw`=delete word+space)
43. `N: <verb>iW/aW` : **i**nner/**a**round **W**ORD (includes punctuation, e.g. `ciW`)
44. `N: <verb>is/as` : **i**nner/**a**round **s**entence (`dis`=delete sentence, `cas`=change+fix spacing) [-]
45. `N: <verb>ip/ap` : **i**nner/**a**round **p**aragraph (`dip`=delete para, `dap`=delete para+blank)
46. `N: <verb>i"/a"` : **i**nner/**a**round **"** double quotes (`ci"`=change in quotes, `da"`=delete all)
47. `N: <verb>i'/a'` : **i**nner/**a**round **'** single quotes (same as above)
48. `N: <verb>i` `` `/a` `` ` : **i**nner/**a**round backticks (same as above)
49. `N: <verb>iq/aq` : **i**nner/**a**round nearest **q**uote (auto-detects "/'/`) [-]
50. `N: <verb>i(/a(` : **i**nner/**a**round **(**parenthesis (`di(`=delete contents, `da(`=delete all)
51. `N: <verb>i[/a[` : **i**nner/**a**round **[** square brackets (same as above)
52. `N: <verb>i{/a{` : **i**nner/**a**round **{** curly braces (same as above)
53. `N: <verb>i</a<` : **i**nner/**a**round **<** angle brackets (same as above)
54. `N: <verb>ib/ab` : **i**nner/**a**round nearest **b**racket (auto-detects type)
55. `N: <verb>i*/a*` : **i**nner/**a**round ***** asterisks (markdown bold, e.g. `ci*`)
56. `N: <verb>i_/a_` : **i**nner/**a**round **_** underscores (markdown italic, e.g. `ca_`)
57. `N: <verb>2a{` : **a**round 2nd-nearest **{** braces (count before a/i, e.g. `d2a{`, `c3i(`)
58. `N: <verb>if/af` : **i**nner/**a**round **f**unction/method definition (`cif`=change function body)
59. `N: <verb>ic/ac` : **i**nner/**a**round **c**lass/type definition (`dac`=delete entire class)
60. `N: <verb>io/ao` : **i**nner/**a**round **o**bject (blocks/loops/conditionals)
61. `N: <verb>it/at` : **i**nner/**a**round html-like **t**ag (works with JSX, e.g. `dit`=delete tag contents)
62. `N: <verb>ii/ai` : **i**nner/**a**round **i**ndentation scope (requires mini.indentscope extra) [+]
63. `N: <verb>ih/ah` : **i**nner/**a**round git **h**unk (`dih`=revert hunk)
64. `N: <verb>ig/ag` : **i**nner/**a**round **g**lobal buffer (`yig`=yank all, `cag`=delete all+insert)
65. `N: <verb>in{/an{` : **i**nner/**a**round **n**ext **{** object (n=next, l=last, e.g. `cin{`) [-]

### editing - surround (mini.surround)

66. `N: gsa<motion><wrap>` : **g**o **s**urround **a**dd - wrap text with char (`gsaiw"`=word, `gsa$*`=to-end) [+]
67. `N: gsd<char>` : **g**o **s**urround **d**elete - remove surrounding (`gsd"`=remove quotes, `2gsd{`=2nd braces) [+]
68. `N: gsr<old><new>` : **g**o **s**urround **r**eplace - change surrounding (`gsr"'`=quotes to apostrophes) [+]
69. `N: gsf/gsF<char>` : **f**ind next/prev surrounding char (`gsf(`=jump to next open paren) [-]
70. `N: g[/g]<char>` : jump to open/close surrounding char (`g[(`=back to open paren, `2g]}`=2nd close brace)
71. `N: gsh<char>` : **h**ighlight surrounding pairs (dry-run for delete/replace, e.g. `gsh(`)
72. `N: gsaapt` : **a**dd **t**ag around paragraph (prompts for tag name, `gsaaptdiv` wraps in `<div>`) [+]
73. `V: gsa<wrap>` : surround visual selection with char [+]
74. **wrap chars**: `"` `'` `` ` `` `)` or **b** (parens), `}` or **B** (braces), `]` or **r** (brackets)
75. **spacing**: `(` adds spaces inside parens, `)` doesn't (`gsaiw(` → `( word )` vs `)` → `(word)`)

### editing - surround (custom config) [!]

76. `;;<motion><wrap>` : add surround (replaces `gsa`, easier to type) [!]
77. `;d<char>` : delete surround (replaces `gsd`) [!]
78. `;r<old><new>` : replace surround (replaces `gsr`) [!]
79. `;f/;F<char>` : find next/prev surround (replaces `gsf/gsF`) [!]
80. `;h<char>` : highlight surround (replaces `gsh`) [!]
81. `;n` : update n lines (replaces `gsn`) [!]
82. **config**: create `lua/plugins/extend-mini-surround.lua` with author's code from chapter 7 [!]

### editing - seek surrounding objects

83. `N: <verb>S` : **S**eek **s**urround - label pairs around cursor, pick to operate (`cSa`=change at label a) [+]
84. `N: <verb>R` : **R**emote surround - seek text, then label surrounds (`dRfooaenter`=seek foo, delete surround)
85. `N: <verb>r<motion>` : **r**emote operate - seek text, apply motion, return (`drAth2w`=delete 2 words at label h) [-]

### repeating & recording

86. `N: .` : **.**dot repeat = repeat last command/edit
87. `N: qq...q/Q` : record macro (**q**uery) - start/stop/replay with **Q**
88. `N: u/ctrl+r` : **u**ndo / **r**edo
89. `N: <n>i<text><esc>` : **i**nsert text n times (e.g. `80i*<esc>`=ruler)

### command model

90. **structure**: `[count]<verb>[count]<motion>` where verb operates on text defined by motion
91. **operator-pending mode**: after typing verb (d/c/gU/etc), you're in operator-pending mode
92. **text objects vs motions**: objects use a/i context, motions don't (e.g. `diw` vs `dw`)
93. **note**: diagnostic jumps `[d/]d` and git hunks `[h/]h` cannot be combined with verbs

## opencode

### neovim plugin

1. `N/V: <leader>oa` : **o**pencode **a**sk - prompt with @this context (selection/cursor), auto-submit
2. `N/V: <leader>ox` : **o**pencode action - select from menu (explain/fix/optimize/test/comment)
3. `N/T: <leader>oc` : **o**pencode **c**hat - toggle embedded terminal window
4. `N: <leader>ou/od` : scroll chat **u**p/**d**own half page
5. `N: <leader>on/oi` : **n**ew session (clear history) / **i**nterrupt AI response
6. `N/V: go<motion>` : add range to chat (`goip`=paragraph, `go3j`=3-lines) without submitting
7. `N: goo` : add current line to chat

### context placeholders (use in prompts)

8. `@buffer/@selection/@this` : entire file / visual selection / smart context (selection or cursor)
9. `@diagnostics/@diff/@cursor` : LSP errors+warnings / git changes / current line
10. `@visible/@quickfix` : text in viewport / quickfix list items

### chat commands (type inside opencode)

11. `/init` : analyze project structure (run on new projects)
12. `/undo//redo` : revert/restore AI file changes
13. `/share//help//clear//exit` : share link / show commands / clear history / close session

### internal

14. `ctrl+x n/i/a` : **n**ew session / **i**nterrupt / toggle **a**gent (plan=review, build=apply)
15. `ctrl+x t` : switch **t**heme
16. `ctrl+g` : cancel operation
17. `up/tab` : previous prompts history / autocomplete @placeholders

### quick tips

- combine contexts: `@buffer @diagnostics fix all issues`
- plan agent (`ctrl+x a`) reviews before applying (safer for big refactors)
- reload nvim buffers after AI edits: `:e!`
- undo bad changes immediately: `/undo`

## hyprland

1. `super + shift + h/j/k/l`: swap windows
