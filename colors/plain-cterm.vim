" Name:       plain.vim
" Version:    0.1
" Maintainer: github.com/andreypopp
" License:    The MIT License (MIT)
"
" Based on
"
"   https://github.com/pbrisbin/vim-colors-off (MIT License)
"
" which in turn based on
"
"   https://github.com/reedes/vim-colors-pencil (MIT License)
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='plain'

let s:none              = {"cterm": "NONE"}

let s:dark_black        = {"cterm": "0"}
let s:black             = {"cterm": "8"}

let s:dark_red          = {"cterm": "1"}
let s:red               = {"cterm": "9"}

let s:dark_green        = {"cterm": "2"}
let s:green             = {"cterm": "10"}

let s:dark_yellow       = {"cterm": "3"}
let s:yellow            = {"cterm": "11"}

let s:dark_blue         = {"cterm": "4"}
let s:blue              = {"cterm": "12"}

let s:dark_magenta      = {"cterm": "5"}
let s:magenta           = {"cterm": "13"}

let s:dark_cyan         = {"cterm": "6"}
let s:cyan              = {"cterm": "14"}

let s:dark_white        = {"cterm": "7"}
let s:white             = {"cterm": "15"}

let s:always_dark_black = {"cterm": "16"}
let s:always_black      = {"cterm": "17"}

let s:always_dark_white = {"cterm": "18"}
let s:always_white      = {"cterm": "19"}

let s:bg               = s:none
let s:bg_subtle        = s:dark_white
let s:norm             = s:none
let s:norm_subtle      = s:black
let s:visual           = s:cyan
let s:visual_fg        = s:white
let s:cursor_line      = {"cterm": "20"}
let s:constant         = s:cyan
let s:comment          = s:black
let s:selection        = s:yellow
let s:selection_fg     = s:always_dark_black
let s:ok               = s:green
let s:warning          = s:dark_yellow
let s:error            = s:dark_red

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
    \ "guisp="   (has_key(a:style, "guisp") ? a:style.guisp    : "NONE")
    \ "guifg=NONE"
    \ "guibg=NONE"
    \ "gui=NONE"
endfunction

" __Normal__
if has("gui")
    call s:h("Normal",    {"fg": s:norm, "bg": s:bg})
    call s:h("Cursor",    {"fg": s:bg, "bg": s:norm})
else
    call s:h("Normal",    {"fg": s:norm})
    hi! link Cursor       Identifier
endif
hi! link Identifier       Normal
hi! link Function         Identifier
hi! link Type             Normal
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type
hi! link Special          Normal
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special
hi! link VertSplit        Normal
hi! link PreProc          Normal
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

" __Operator__
call s:h("Noise",         {"fg": s:norm_subtle})
hi! link Operator         Noise
hi! link LineNr           Noise
hi! link CursorLineNr     LineNr
hi! link FoldColumn       LineNr
hi! link SignColumn       LineNr

" __Comment__
call s:h("Comment",       {"fg": s:comment, "cterm": "italic"})

" __Constant__
call s:h("Constant",      {"fg": s:constant})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant
hi! link Directory        Constant
hi! link Title            Constant

" __Statement__
call s:h("Statement",     {"fg": s:norm, "cterm": "bold"})
hi! link Include          Statement
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

" __ExtraWhitespace__
call s:h("ExtraWhitespace",  {"bg": s:error})

" __ErrorMsg__
call s:h("ErrorMsg",      {"fg": s:error})
hi! link Error            ErrorMsg
hi! link Question         ErrorMsg
" __WarningMsg__
call s:h("WarningMsg",    {"fg": s:warning})
" __InfoMsg__
call s:h("InfoMsg",       {"fg": s:dark_magenta, "cterm": "bold"})
" __MoreMsg__
call s:h("MoreMsg",       {"fg": s:norm_subtle, "cterm": "bold"})
hi! link ModeMsg          MoreMsg

" __NonText__
call s:h("NonText",       {"fg": s:norm_subtle})
hi! link Folded           NonText
hi! link qfLineNr         NonText

" __Visual__
call s:h("Visual",        {"bg": s:visual, "fg": s:visual_fg})
" __VisualNOS__
call s:h("VisualNOS",     {"bg": s:bg_subtle, "fg": s:visual_fg})

call s:h("Ignore",        {"fg": s:bg})

" __DiffAdd__
call s:h("DiffAdd",       {"fg": s:dark_green})
" __DiffDelete__
call s:h("DiffDelete",    {"fg": s:dark_red})
" __DiffChange__
call s:h("DiffChange",    {"fg": s:dark_yellow})
" __DiffText__
call s:h("DiffText",      {"fg": s:constant})

if has("gui_running")
  call s:h("SpellBad",    {"sp": s:dark_red})
  call s:h("SpellCap",    {"sp": s:ok})
  call s:h("SpellRare",   {"sp": s:error})
  call s:h("SpellLocal",  {"sp": s:ok})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:dark_red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:ok})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:error})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:ok})
endif

hi! link helpHyperTextEntry Title
hi! link helpHyperTextJump  String

call s:h("StatusLine", {
      \"cterm": "bold,underline",
      \"bg": s:bg,
      \"fg": s:norm
      \})
call s:h("StatusLineNC", {
      \"cterm": "bold,underline",
      \"bg": s:bg,
      \"fg": s:bg_subtle
      \})

" Semantic status line highlights
call s:h("StatusLineOk", {
      \"cterm": "bold,underline",
      \"bg": s:bg,
      \"fg": s:ok
      \})
call s:h("StatusLineError", {
      \"cterm": "bold,underline",
      \"bg": s:bg,
      \"fg": s:error
      \})
call s:h("StatusLineWarning", {
      \"cterm": "bold,underline",
      \"bg": s:bg,
      \"fg": s:warning
      \})

call s:h("WildMenu",      {"cterm": "underline,bold", "bg": s:bg, "fg": s:norm})

" __Pmenu__
call s:h("Pmenu",         {"fg": s:norm, "bg": s:cursor_line})
hi! link PmenuSbar        Pmenu
hi! link PmenuThumb       Pmenu
" __PmenuSel__
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:cursor_line, "cterm": "bold"})

hi! link TabLine          Normal
hi! link TabLineSel       Keyword
hi! link TabLineFill      Normal

" __CursorLine__
call s:h("CursorLine",    {"bg": s:cursor_line})
" __CursorColumn__
call s:h("ColorColumn",   {"bg": s:cursor_line})

" __MatchParen__
call s:h("MatchParen",    {"bg": s:yellow, "fg": s:always_dark_black})

hi! link htmlH1 Normal
hi! link htmlH2 Normal
hi! link htmlH3 Normal
hi! link htmlH4 Normal
hi! link htmlH5 Normal
hi! link htmlH6 Normal

hi link diffRemoved       DiffDelete
hi link diffAdded         DiffAdd

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

hi link jsFlowTypeKeyword Statement
hi link jsFlowImportType Statement
hi link jsFunction Statement
hi link jsGlobalObjects Normal
hi link jsGlobalNodeObjects Normal
hi link jsArrowFunction Noise
hi link StorageClass Statement

hi link xmlTag Constant
hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag
hi link xmlAttrib xmlTag

hi link markdownH1 Statement
hi link markdownH2 Statement
hi link markdownH3 Statement
hi link markdownH4 Statement
hi link markdownH5 Statement
hi link markdownH6 Statement
hi link markdownListMarker Constant
hi link markdownCode Constant
hi link markdownCodeBlock Constant
hi link markdownCodeDelimiter Constant
hi link markdownHeadingDelimiter Constant

hi link yamlBlockMappingKey Statement
hi link pythonOperator Statement

hi link ALEWarning WarningMsg
hi link ALEWarningSign WarningMsg
hi link ALEError ErrorMsg
hi link ALEErrorSign ErrorMsg
hi link ALEInfo InfoMsg
hi link ALEInfoSign InfoMsg

" __Search__ (make sure it comes after everything else)
call s:h("Search",        {"bg": s:selection, "fg": s:selection_fg})
hi! link IncSearch Search
