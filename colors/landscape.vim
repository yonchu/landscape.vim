" landscape.vim
" terminal colorcheme : aereal/magica-colors


" === Setup {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif

let colors_name = 'landscape'

set background=dark

augroup MyLandscapeAu
  autocmd!
augroup END
" }}}

" === Utilities {{{
" http://noahfrederick.com/vim-color-scheme-hemisu/
function! s:h(group, style)
  execute 'highlight' a:group
      \ 'term='    (has_key(a:style, 'term')  ? a:style.term  : 'NONE')
      \ 'gui='     (has_key(a:style, 'gui')   ? a:style.gui   : 'NONE')
      \ 'cterm='   (has_key(a:style, 'cterm') ? a:style.cterm : 'NONE')
      \ 'guifg='   (has_key(a:style, 'fg')    ? (has_key(a:style.fg, 'gui')   ? a:style.fg.gui   : 'NONE') : 'NONE')
      \ 'guibg='   (has_key(a:style, 'bg')    ? (has_key(a:style.bg, 'gui')   ? a:style.bg.gui   : 'NONE') : 'NONE')
      \ 'guisp='   (has_key(a:style, 'sp')    ? (has_key(a:style.sp, 'gui')   ? a:style.sp.gui   : 'NONE') : 'NONE')
      \ 'ctermfg=' (has_key(a:style, 'fg')    ? (has_key(a:style.fg, 'cterm') ? a:style.fg.cterm : 'NONE') : 'NONE')
      \ 'ctermbg=' (has_key(a:style, 'bg')    ? (has_key(a:style.bg, 'cterm') ? a:style.bg.cterm : 'NONE') : 'NONE')
endfunction

function! s:newmatch()
  if g:landscape_highlight_url ||
   \ g:landscape_highlight_todo ||
   \ g:landscape_highlight_full_space
    if exists('b:landscape_match')
      for m in getmatches()
        if m.group == 'URL' ||
         \ m.group == 'Todo' ||
         \ m.group == 'FullSpace'
          call matchdelete(m.id)
        endif
      endfor
    endif
    if g:landscape_highlight_url
      call matchadd('URL',
            \'\(https\?\|ftp\|git\):\/\/\('
            \.'[&:#*@~%_\-=?/.0-9A-Za-z]*'
            \.'\(([&:#*@~%_\-=?/.0-9A-Za-z]*)\)\?'
            \.'\({\([&:#*@~%_\-=?/.0-9A-Za-z]*\|{[&:#*@~%_\-=?/.0-9A-Za-z]*}\)}\)\?'
            \.'\(\[[&:#*@~%_\-=?/.0-9A-Za-z]*\]\)\?'
            \.'\)*[/0-9A-Za-z]*\(:\d\d*\/\?\)\?', -1)
    endif
    if g:landscape_highlight_todo
      call matchadd('Todo', '\<\([tT]odo\|TODO\)\>', -1)
    endif
    if g:landscape_highlight_full_space
      call matchadd('FullSpace', '　', -1)
    endif
    let b:landscape_match = 1
  endif
endfunction
" }}}

" String/Statement/Type/PreProc
"
" Number/Identifier/Operator/Special

call s:h('Normal',   {'fg': {'gui': '#dddddd'}, 'bg': {'cterm': 'black', 'gui': 'grey0'}})

call s:h('Comment',  {'fg': {'cterm': '243', 'gui': '#767676'}})
call s:h('Constant', {'fg': {'cterm': '111', 'gui': '#87afff'}})
call s:h('String',   {'fg': {'cterm': '209', 'gui': '#ffaf5f'}})
call s:h('Character',{'fg': {'cterm': '214', 'gui': '#ffaf00'}})
call s:h('Number',   {'fg': {'cterm': '81' , 'gui': '#5fdfff'}})
call s:h('Boolean',  {'fg': {'cterm': '227', 'gui': '#ffff5f'}})
call s:h('Float',    {'fg': {'cterm': '85' , 'gui': '#5fffaf'}})

call s:h('Identifier', {'fg': {'cterm': '117', 'gui': '#87dfff'}})
call s:h('Function'  , {'fg': {'cterm': '123', 'gui': '#5fffff'}})

call s:h('Statement', {'fg': {'cterm': '77' , 'gui': '#5fdf00'}})
highlight default link Repeat Statement
highlight default link Label Statement
highlight default link Keyword Statement
highlight default link Exception Statement

call s:h('Operator'   , {'fg': {'cterm': '220', 'gui': '#ffdf00'}})
call s:h('Conditional', {'fg': {'cterm': '166', 'gui': '#ef7f00'}})

call s:h('PreProc'  , {'fg': {'cterm': '32', 'gui': '#00afff'}})
call s:h('Include'  , {'fg': {'cterm': '38', 'gui': '#00afdf'}})
call s:h('Define'   , {'fg': {'cterm': '37', 'gui': '#00afaf'}})
call s:h('Macro'    , {'fg': {'cterm': '36', 'gui': '#00af87'}})
call s:h('PreCondit', {'fg': {'cterm': '35', 'gui': '#00af5f'}})

call s:h('Type'        , {'fg': {'cterm': '177', 'gui': '#ff9fff'}})
call s:h('StorageClass', {'fg': {'cterm': '201', 'gui': '#ff7fff'}})
call s:h('Structure'   , {'fg': {'cterm': '200', 'gui': '#ff7fdf'}})
call s:h('Typedef'     , {'fg': {'cterm': '199', 'gui': '#ff7faf'}})

call s:h('Special'       , {'fg': {'cterm': '178', 'gui': 'orange'}})
call s:h('SpecialChar'   , {'fg': {'cterm': '208', 'gui': 'orange'}})
call s:h('Tag'           , {'fg': {'cterm': '180', 'gui': 'orange'}})
call s:h('Delimiter'     , {'fg': {'cterm': '181', 'gui': 'orange'}})
call s:h('SpecialComment', {'fg': {'cterm': '182', 'gui': 'violet'}})
call s:h('Debug'         , {'fg': {'cterm': '183', 'gui': 'violet'}})

call s:h('TabLine'    , {'fg': {'cterm': '253', 'gui': '#dadada'}, 'bg': {'cterm': '241', 'gui': '#606060'}})
call s:h('TabLineFill', {'fg': {'cterm': '253', 'gui': '#dadada'}, 'bg': {'cterm': '241', 'gui': '#606060'}})
call s:h('TabLineFill', {'fg': {'cterm': '253', 'gui': '#dadada'}, 'cterm': 'bold'})

call s:h('Visual', {'bg': {'cterm': '241', 'gui': '#606060'}})
highlight default link VisualNOS Visual

call s:h('Underlined', {'fg': {'cterm': '45', 'gui': '#00dfff'}, 'cterm': 'underline', 'gui': 'underline'})
highlight default link URL Underlined

call s:h('Error'     , {'fg': {'cterm': '15', 'gui': '#ffffff'}, 'bg': {'cterm': '124', 'gui': '#af0000'}})
call s:h('WarningMsg', {'fg': {'cterm': '7' , 'gui': '#c0c0c0'}, 'bg': {'cterm': '0'  , 'gui': '#000000'}})
call s:h('Todo'      , {'fg': {'cterm': '16', 'gui': '#000000'}, 'bg': {'cterm': '185', 'gui': '#dfdf5f'}})

call s:h('DiffAdd'    , {'fg': {'gui': 'fg'}, 'bg': {'cterm': '22' , 'gui': '#005f00'}})
call s:h('DiffChange' , {'fg': {'gui': 'fg'}, 'bg': {'cterm': '52' , 'gui': '#5f0000'}})
call s:h('DiffDelete' , {'fg': {'gui': 'fg'}, 'bg': {'cterm': '88' , 'gui': '#870000'}})
call s:h('DiffText'   , {'fg': {'gui': 'fg'}, 'bg': {'cterm': '160', 'gui': '#df0000'}})
call s:h('DiffFile'   , {'fg': {'cterm': '47' , 'gui': '#00ff5f'}, 'bg': {'gui': 'bg'}})
call s:h('DiffNewFile', {'fg': {'cterm': '199', 'gui': '#ff00af'}, 'bg': {'gui': 'bg'}})
call s:h('DiffLine'   , {'fg': {'cterm': '129', 'gui': '#af00ff'}, 'bg': {'gui': 'bg'}})
call s:h('Ignore'     , {'fg': {'gui': 'bg'}})
highlight default link DiffRemoved DiffDelete
highlight default link DiffAdded DiffAdd
highlight default link ErrorMsg Error
highlight default link FullSpace Error

call s:h('VertSplit', {'fg': {'cterm': 'black', 'gui': 'black'}, 'bg': {'cterm': '59', 'gui': 'darkgray'}})

call s:h('Folded'    , {'fg': {'cterm': 'darkred', 'gui': '#9e9e9e'}, 'bg': {'cterm': '233', 'gui': '#262626'},
      \ 'cterm': 'bold', 'gui': 'underline'})
call s:h('FoldColumn', {'fg': {'cterm': 'white'  , 'gui': '#9e9e9e'}, 'bg': {'cterm': '233', 'gui': '#262626'}})
call s:h('SignColumn', {'fg': {'cterm': '247'    , 'gui': '#9e9e9e'}, 'bg': {'cterm': '235', 'gui': '#262626'}})

call s:h('SpecialKey', {'fg': {'cterm': 'darkgray', 'gui': 'darkgray'}, 'cterm': 'underline'})
call s:h('NonText'   , {'fg': {'cterm': 'black'   , 'gui': 'black'}})

call s:h('StatusLineNC', {'fg': {'cterm': 'black', 'gui': 'black'}, 'bg': {'cterm': 'darkgray', 'gui': 'darkgray'}})

if version >= 700
  call s:h('CursorLine'  , {'bg': {'cterm': '235', 'gui': '#262626'}})
  call s:h('ColorColumn' , {'bg': {'cterm': '232', 'gui': '#4e4e4e'}})
  call s:h('CursorColumn', {'bg': {'cterm': '235', 'gui': '#262626'}})

  autocmd MyLandscapeAu InsertLeave *
        \ highlight CursorLine   ctermbg=235 |
        \ highlight CursorLineNr ctermbg=235
  autocmd MyLandscapeAu InsertEnter *
        \ highlight CursorLine   ctermbg=18 |
        \ highlight CursorLineNr ctermbg=18

  call s:h('LineNr'      , {'fg': {'cterm': '58' , 'gui': '#5f5f00'}, 'bg': {'gui': 'bg'}})
  call s:h('CursorLineNr', {'fg': {'cterm': '148', 'gui': '#afdf00'}, 'bg': {'cterm': '235', 'gui': '#262626'},
        \ 'term': 'underline', 'cterm': 'bold', 'gui': 'bold'})

  call s:h('MatchParen', {'bg': {'cterm': '52', 'gui': '#3a3a3a'}})

  call s:h('Pmenu'     , {'fg': {'cterm': 'black', 'gui': 'black'}, 'bg': {'cterm': 'gray', 'gui': 'gray'}})
  call s:h('PmenuSel'  , {'fg': {'cterm': 'black', 'gui': 'black'}, 'bg': {'cterm': 'darkgray', 'gui': 'darkgray'}})
  call s:h('PmenuSbar' , {'fg': {'cterm': 'white', 'gui': 'white'}, 'bg': {'cterm': 'darkgray', 'gui': 'darkgray'}})
  call s:h('PmenuThumb', {'fg': {'cterm': 'white', 'gui': 'white'}, 'bg': {'cterm': 'darkgray', 'gui': 'darkgray'}})
endif

call s:h('Search'   , {'fg': {'cterm': '234', 'gui': '#1c1c1c'}, 'bg': {'cterm': '220', 'gui': '#ffdf00'}})
call s:h('IncSearch', {'fg': {'cterm': '236', 'gui': '#303030'}, 'bg': {'cterm': '136', 'gui': '#af8700'}})

call s:h('SpellBad', {'bg': {'cterm': '52', 'gui': '#5f0000'}})
highlight default link SpellCap SpellBad
highlight default link SpellLocal SpellBad
highlight default link SpellRare SpellBad

highlight default link vimCmplxRepeat Normal

" === vimshell, vimfiler, unite.vim {{{
highlight default link Command Function
highlight default link GitCommand Constant
highlight default link Arguments Type
highlight default link PdfHtml Function
highlight default link Archive Special
highlight default link Image Type
highlight default link Multimedia SpecialComment
highlight default link System Comment
highlight default link Text Constant
highlight default link Link Constant
highlight default link Exe Statement
highlight default link Prompt Identifier
highlight default link Icon LineNr

call s:h('Time', {'bg': {'cterm': '141', 'gui': '#af87ff'}})
call s:h('Date', {'bg': {'cterm': '140', 'gui': '#af87df'}})
highlight default link DateToday Special
highlight default link DateWeek Identifier
highlight default link DateOld Comment
highlight default link Path Preproc
highlight default link Marked StorageClass
highlight default link Title Identifier
" }}}

" === Other Plugins {{{
" indent-guides.vim
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray  ctermbg=12
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=239

" vim-hier
call s:h('qf_error_ucurl'  , {'cterm': 'undercurl', 'sp': {'gui': 'red'}})
call s:h('qf_warning_ucurl', {'cterm': 'undercurl', 'sp': {'gui': 'blue'}})

" Showmarks
call s:h('ShowMarksHLl', {'fg': {'cterm': 'blue', 'gui': 'blue'}, 'bg': {'cterm': 'black', 'gui': 'black'}})
call s:h('ShowMarksHLu', {'fg': {'cterm': 'blue', 'gui': 'blue'}, 'bg': {'cterm': 'lightyellow', 'gui': 'black'}})
call s:h('ShowMarksHLo', {'fg': {'cterm': 'blue', 'gui': 'blue'}, 'bg': {'cterm': 'black', 'gui': 'black'}})
call s:h('ShowMarksHLm', {'fg': {'cterm': 'blue', 'gui': 'blue'}, 'bg': {'cterm': 'black', 'gui': 'black'}, 'cterm': 'bold', 'gui': 'bold'})

" MiniBufExpl
highlight def link MBEChanged               MBENormal
highlight def link MBEVisibleChanged        MBEVisibleNormal
highlight def link MBEVisibleChangedActive  MBEVisibleActive
" }}}


autocmd MyLandscapeAu BufRead * call <SID>newmatch()

" Conceal
" Cursor
" CursorIM
" Directory
" ModeMsg
" MoreMsg
" Question
" StatusLine
" WildMenu
