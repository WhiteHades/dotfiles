# keybindings

## contents

1. [tmux](#tmux)
2. [fzf](#fzf)

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

## neovim / lazyvim / nvim

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

### editing - delete

12. `N: d<motion>` : **d**elete text from cursor to motion (`dw`=word, `d$`=to-end, `dt=`=**t**ill =)
13. `N: dd/D` : **d**elete entire line / **D**elete to line end (double-d = line)
14. `N: x/X` : e**x**terminate char under/before cursor
15. `N: <n>x` : delete n chars (e.g. `5x`)

### editing - change

16. `N: c<motion>` : **c**hange (delete + insert) text from cursor to motion (`cw`=word, `ciw`=**i**nner word)
17. `N: cc/C` : **c**hange entire line / **C**hange to line end (double-c = line)
18. `N: r<char>` : **r**eplace single char under cursor

### editing - text manipulation

19. `N: J/gJ` : **J**oin lines (with/without space, g=no-space)
20. `N: gU<motion>` : **g**o **U**ppercase text from cursor to motion (`gUiw`=word)
21. `N: gu<motion>` : **g**o **u**ppercase (lowercase) text from cursor to motion (`guiw`=word)
22. `N: gUU/guu` : uppercase/lowercase entire line (double = line)
23. `N: ~` : **~** tilde = toggle case of char

### editing - surround (mini.surround)

24. `N: gsa<motion><wrap>` : **g**o **s**urround **a**dd - wrap text (`gsaiw"`=word, `gsat="`=**t**ill =)
25. `N: gsaiw/gsaiW` : surround **i**nner **w**ord / **i**nner **W**ORD (W=includes punctuation)
26. `N: gsat<char>` : surround **t**ill char (not including, e.g. `gsat="`)
27. `N: gsa<n>l` : surround n chars (e.g. `gsa2l"`)
28. `N: gsd<char>` : **g**o **s**urround **d**elete - remove surrounding (e.g. `gsd"`)
29. `N: gsr<old><new>` : **g**o **s**urround **r**eplace - change surrounding (e.g. `gsr"'`)
30. `V: gsa<wrap>` : surround selected text
31. **wrap chars**: `"` `'` `` ` `` `)` or **b** (parens), `}` or **B** (braces), `]` or **r** (brackets)

### repeating & recording

32. `N: .` : **.**dot repeat = repeat last command/edit
33. `N: qq...q/Q` : record macro (**q**uery) - start/stop/replay with **Q**
34. `N: u/ctrl+r` : **u**ndo / **r**edo
35. `N: <n>i<text><esc>` : **i**nsert text n times (e.g. `80i*<esc>`=ruler)

### command model

36. **structure**: `[count]<verb>[count]<motion>` where verb operates on text defined by motion

## hyprland / hyprscrollling

1. `super + shift + h/j/k/l`: swap windows
