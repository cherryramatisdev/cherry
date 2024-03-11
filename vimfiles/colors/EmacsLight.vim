" Emacs default theme for vim
"
" Permission to use, copy, modify, and/or distribute this software for any
" purpose with or without fee is hereby granted.

set background=light
hi clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let colors_name = "emacs"

if version >= 700
  hi CursorLine     guibg=#FBFFFF                                     ctermbg=231
  hi CursorColumn   guibg=#FBFFFF                                     ctermbg=231
  hi MatchParen     guifg=#1B34C0 guibg=#FBFFFF gui=bold   ctermfg=25 ctermbg=231 cterm=bold
  hi Pmenu          guifg=#000000 guibg=#C8C8C8            ctermfg=16 ctermbg=251
  hi PmenuSel       guifg=#000000 guibg=#870096            ctermfg=16 ctermbg=90
endif

" Background and menu colors
hi Cursor           guifg=NONE    guibg=#000000 gui=none ctermbg=16
hi Normal           guifg=#000000 guibg=#FBFFFF gui=none ctermfg=16  ctermbg=231  cterm=none
hi NonText          guifg=#0000d7 guibg=#FBFFFF gui=none ctermfg=20  ctermbg=231  cterm=none
hi LineNr           guifg=#B4B8B8 guibg=#eeeeee gui=none ctermfg=249 ctermbg=255  cterm=none
hi StatusLine       guifg=#ffffff guibg=#1c1c1c gui=none ctermfg=234 ctermbg=231  cterm=italic
hi StatusLineNC     guifg=#000000 guibg=#D3D7D7 gui=none ctermfg=16  ctermbg=188  cterm=none
hi VertSplit        guifg=#000000 guibg=#E2E6E6 gui=none ctermfg=16  ctermbg=254  cterm=none
hi Folded           guifg=#000000 guibg=#FBFFFF gui=none ctermfg=16  ctermbg=231  cterm=none
hi Title            guifg=#870096 guibg=NONE	gui=bold ctermfg=90  ctermbg=NONE cterm=bold
hi Visual           guifg=#7600ED guibg=#C8C8C8 gui=none ctermfg=93  ctermbg=251  cterm=none
hi SpecialKey       guifg=#C38C5A guibg=#ECF0F0 gui=none ctermfg=137 ctermbg=255  cterm=none
"hi DiffChange      guibg=#FCFFB2               gui=none             ctermbg=229  cterm=none
"hi DiffAdd         guibg=#D5D8FF               gui=none             ctermbg=189  cterm=none
"hi DiffText        guibg=#FCCBFF               gui=none             ctermbg=225  cterm=none
"hi DiffDelete      guibg=#FCBFBF               gui=none             ctermbg=217  cterm=none

" Syntax highlighting
hi Comment          guifg=#af0000               gui=none ctermfg=124              cterm=none
hi Constant         guifg=#af5f00               gui=none ctermfg=130              cterm=none
hi Number           guifg=#af5f00               gui=none ctermfg=130              cterm=none
hi Identifier       guifg=#00afaf               gui=none ctermfg=37               cterm=none
hi Statement        guifg=#870087               gui=none ctermfg=90               cterm=none
hi Function         guifg=#0000ff               gui=none ctermfg=21               cterm=none
hi Special          guifg=#B30061               gui=none ctermfg=125              cterm=none
hi PreProc          guifg=#000087               gui=none ctermfg=18               cterm=none
hi Keyword          guifg=#0000ff               gui=none ctermfg=21               cterm=none
hi String           guifg=#87005f               gui=none ctermfg=89               cterm=none
hi Type             guifg=#008700               gui=none ctermfg=28               cterm=none
hi pythonBuiltin    guifg=#af0087               gui=none ctermfg=126              cterm=none
hi TabLineFill      guifg=#C599F7               gui=none ctermfg=177              cterm=none

hi! link Structure Statement
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Exception Statement
" OCaml
hi! link ocamlLCIdentifier Number
hi! link ocamlKeyword Statement
hi! link ocamlBoolean Identifier
hi! link ocamlThenErr  Statement
hi! link ocamlModule Type
hi! link ocamlOperator Number
" Assembly
hi asmLabel cterm=none ctermbg=231 ctermfg=20
hi asmIdentifier guifg=#870087 cterm=none ctermbg=231 ctermfg=90
