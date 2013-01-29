
set background=dark
highlight clear

let colors_name = "landscape"
if exists("syntax_on")
  syntax reset
endif

highlight Normal gui=none guifg=White guibg=grey0
highlight Comment term=none ctermfg=243 ctermbg=none gui=none guifg=#767676
highlight Constant term=none ctermfg=159 gui=none guifg=#afffff
highlight String term=none ctermfg=215 ctermbg=none gui=none guifg=#ffaf5f
highlight Character term=none ctermfg=214 ctermbg=none gui=none guifg=#ffaf00
highlight Number term=none ctermfg=81 ctermbg=none gui=none guifg=#5fdfff
highlight Boolean term=none ctermfg=226 ctermbg=none gui=none guifg=#ffff00
highlight Float term=none ctermfg=43 ctermbg=none gui=none guifg=#00dfaf

highlight Identifier term=none cterm=none ctermfg=104 ctermbg=none gui=none guifg=#8787df
highlight Function term=none ctermfg=46 ctermbg=none gui=none guifg=#00ff00

highlight Statement term=none ctermfg=118 ctermbg=none gui=none guifg=#87ff00
highlight Conditional term=none ctermfg=166 ctermbg=none gui=none guifg=#df5f00
highlight default link Repeat Conditional
highlight default link Label Statement
highlight Operator term=none ctermfg=220 ctermbg=none gui=none guifg=#ffdf00
highlight default link Keyword Statement
highlight default link Exception Statement

highlight PreProc term=none ctermfg=39 gui=none guifg=#00afff
highlight Include term=none ctermfg=38 gui=none guifg=#00afdf
highlight Define term=none ctermfg=37 gui=none guifg=#00afaf
highlight Macro term=none ctermfg=36 gui=none guifg=#00af87
highlight PreCondit term=none ctermfg=35 gui=none guifg=#00af5f

highlight Type term=none ctermfg=207 ctermbg=none gui=none guifg=#ff5fff
highlight StorageClass term=none ctermfg=201 ctermbg=none gui=none guifg=#ff00ff
highlight Structure term=none ctermfg=200 ctermbg=none gui=none guifg=#ff00df
highlight Typedef term=none ctermfg=199 ctermbg=none gui=none guifg=#ff00af

highlight Special term=none ctermfg=178 gui=none guifg=orange
highlight SpecialChar term=none ctermfg=208 gui=none guifg=orange
highlight Tag term=none ctermfg=180 gui=none guifg=orange
highlight Delimiter term=none ctermfg=181 gui=none guifg=orange
highlight SpecialComment term=none ctermfg=182 gui=none guifg=violet
highlight Debug term=none ctermfg=183 gui=none guifg=violet

highlight Visual term=none ctermbg=241 guibg=#606060
highlight default link VisualNOS Visual
highlight Underlined term=underline ctermfg=51 ctermbg=none gui=none guifg=#00ffff
highlight Error term=none ctermfg=15 ctermbg=124 gui=none guifg=#ffffff guibg=#af0000
highlight WarningMsg term=none ctermfg=7 ctermbg=0 gui=none guifg=#c0c0c0 guibg=#000000
highlight Todo term=none ctermfg=16 ctermbg=11 gui=none guifg=#000000 guibg=#ffff00
highlight DiffAdd term=none cterm=none ctermfg=none ctermbg=22 guifg=fg guibg=#005f00
highlight DiffChange term=none cterm=none ctermfg=none ctermbg=52 guifg=fg guibg=#5f0000
highlight DiffDelete term=none cterm=none ctermfg=none ctermbg=88 guifg=fg guibg=#870000
highlight DiffText term=none cterm=none ctermfg=none ctermbg=160 guifg=fg guibg=#df0000
highlight DiffFile term=none cterm=none ctermfg=47 ctermbg=none guifg=#00ff5f guibg=bg
highlight DiffNewFile term=none cterm=none ctermfg=199 ctermbg=none guifg=#ff00af guibg=bg
highlight default link DiffRemoved DiffDelete
highlight DiffLine term=none cterm=none ctermfg=129 ctermbg=none guifg=#af00ff guibg=bg
highlight default link DiffAdded DiffAdd
highlight default link ErrorMsg Error

highlight VertSplit term=none gui=none guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none
highlight Folded term=none ctermfg=247 ctermbg=235 guifg=#9e9e9e guibg=#262626
highlight SpecialKey term=underline ctermfg=darkgray gui=none guifg=darkgray
highlight NonText term=none ctermfg=black gui=none guifg=black
highlight StatusLineNC term=none gui=none guifg=black guibg=darkgray gui=none ctermfg=black ctermbg=darkgray cterm=none gui=none
if version >= 700
  highlight CursorLine term=underline ctermfg=none gui=underline guibg=gray0
  highlight CursorColumn ctermfg=none
  highlight LineNr ctermfg=142 guifg=#afaf00
  highlight MatchParen ctermfg=none ctermbg=237 guibg=#3a3a3a
  highlight Pmenu ctermfg=black ctermbg=gray gui=none guifg=black guibg=gray
  highlight PmenuSel ctermfg=black ctermbg=darkgray gui=none guifg=black guibg=darkgray
  highlight PmenuSbar ctermfg=white ctermbg=darkgray gui=none guifg=white guibg=darkgray
  highlight PmenuThumb ctermfg=white ctermbg=darkgray gui=none guifg=white guibg=darkgray
endif
augroup MatchAdd
  function! s:newmatch()
    call matchadd('Underlined',
          \'\(https\?\|ftp\|git\):\/\/\('
          \.'[&:#*@~%_\-=?/.0-9A-Za-z]*'
          \.'\(([&:#*@~%_\-=?/.0-9A-Za-z]*)\)\?'
          \.'\({\([&:#*@~%_\-=?/.0-9A-Za-z]*\|{[&:#*@~%_\-=?/.0-9A-Za-z]*}\)}\)\?'
          \.'\(\[[&:#*@~%_\-=?/.0-9A-Za-z]*\]\)\?'
          \.'\)*[/0-9A-Za-z]*\(:\d\d*\/\?\)\?')
    call matchadd('Todo', '[tT]odo\|TODO')
    call matchadd('Error', '　')
  endfunction
  autocmd!
  autocmd BufAdd,BufCreate,BufEnter,WinEnter * call s:newmatch()
augroup END

highlight SpellBad term=none cterm=none ctermbg=52 gui=none guibg=#5f0000
highlight default link SpellCap SpellBad
highlight default link SpellLocal SpellBad
highlight default link SpellRare SpellBad

highlight default link vimCmplxRepeat Normal

" for vimshell, vimfiler, unite.vim
highlight default link Command Function
highlight default link GitCommand Constant
highlight default link Arguments Type
highlight default link PdfHtml Function
highlight default link Archive Special
highlight default link Image Type
highlight default link Multimedia Identifier
highlight default link System Comment
highlight default link Text Constant
highlight default link Link Constant
highlight default link Exe Statement
highlight default link Prompt Identifier
highlight default link Icon LineNr
highlight Time ctermfg=135 ctermbg=none gui=none guifg=#af5fff
highlight Date ctermfg=134 ctermbg=none gui=none guifg=#af5fdf
highlight default link DateToday Special
highlight default link DateWeek Identifier
highlight default link DateOld Comment
highlight default link Path Preproc
highlight default link Marked StorageClass

" ColorColumn
" Conceal
" Cursor
" CursorIM
" Directory
" FoldColumn
" SignColumn
" IncSearch
" ModeMsg
" MoreMsg
" Question
" Search
" StatusLine
" TabLine
" TabLineFill
" TabLineSel
" Title
" Ignore
" WildMenu
