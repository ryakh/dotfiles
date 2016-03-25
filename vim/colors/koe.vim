" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "koe"

" ctermfg = 8 is a replacement for DarkGray

hi YcmErrorSection ctermbg=0
hi YcmErrorSign ctermfg=Black ctermbg=DarkRed
hi Pmenu ctermfg=8 ctermbg=Black guifg=#353535 guibg=#131313
hi Type ctermfg=8 guifg=#353535
hi Statement ctermfg=8 guifg=#353535
hi Comment ctermfg=DarkGreen guifg=#38662F
hi String ctermfg=Green guifg=#BDD322
hi Character ctermfg=Green guifg=#BDD322
hi Identifier ctermfg=DarkBlue guifg=#2C5994
hi Boolean ctermfg=3 guifg=#FABD2F
hi SignColumn ctermbg=Black guibg=#131313
hi Todo ctermbg=NONE guibg=NONE
hi Todo ctermfg=Red guifg=#ff0000
hi Todo cterm=underline gui=underline
hi lineNr ctermfg=DarkRed guifg=#CC241D
hi Number ctermfg=DarkRed guifg=#CC241D
hi cCustomFunc ctermfg=DarkBlue guifg=#2C5994
hi VertSplit ctermfg=black ctermbg=DarkBlue guifg=#131313 guibg=NONE
hi TabLine ctermbg=Black ctermfg=DarkBlue guibg=#131313 guifg=#2C5994
hi TabLineSel ctermfg=DarkRed guifg=#FC1822
hi TabLineFill ctermfg=Black guifg=#131313
hi StatusLine ctermfg=Black ctermbg=DarkBlue guifg=#131313 guibg=#BDD322
hi StatusLineNC ctermfg=Black ctermbg=DarkBlue guifg=#131313 guibg=#BDD322
hi Normal guifg=#606060 guibg=#131313
hi CursorLine cterm=NONE ctermbg=Black gui=NONE guibg=#101010
hi Error ctermfg=Black ctermbg=DarkRed guifg=#131313 guibg=#CC241D

set guifont=Osaka-Mono:h12

" vim: sw=2
