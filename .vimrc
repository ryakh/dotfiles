" GENERAL {{{
"
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set modelines=1   " Allow last line of the file to be modeline

" Tabs and spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Autocomplete for command menu
set wildmenu

" Folding
set foldmethod=indent
set foldcolumn=4
set nofoldenable

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autoexpand HBS brackets
let g:mustache_abbreviations = 1

" Ignore Rails tmp directory
set wildignore+=*/tmp/*

" }}}
" KEY BINDINGS {{{
"
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Leader
let mapleader = " "

" Exuction of current ruby buffer
nnoremap <Leader>r :!clear; ruby %<CR>

" Rename currently opened file
map <Leader>n :call RenameFile()<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<CR>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-rspec mappings
let g:vroom_map_keys = 0
silent! map <unique> <Leader>t :VroomRunTestFile<CR>
silent! map <unique> <Leader>s :VroomRunNearestTest<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Swiftier buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <Leader>p :CtrlPBuffer<CR>

" Better saving
map <Leader>w :w<CR>

" Search for string patterns inside files
map <Leader>a :Ag

" Toggle relative/absolute line numbers
map <Leader>j :call ToggleNumber()<CR>

" }}}
" VISUAL {{{
"
set colorcolumn=80 " display vertical ruler
set cursorline     " higlight current line
set ruler          " show the cursor position all the time

" Display extra whitespace
set list listchars=nbsp:¬,tab:»·,trail:·

" Color scheme
syntax enable
set background=dark
let g:solarized_contrast="high"
colorscheme solarized
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Airline config
let g:airline_theme='solarized'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Numbers
set number
set numberwidth=6

"}}}
" FUNCTIONS {{{
"
" Rename file which is opened in current buffer
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Use Ag (https://github.com/ggreer/the_silver_searcher) instead of Grep when
" available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Toggle between relative and absolute line numbers
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

" }}}
" EDITOR {{{
"
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set syntax highlighting for specific file types
au BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal spell

" Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" CtrlP settings
let g:ctrlp_show_hidden=1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" }}}

" vim:foldmethod=marker:foldlevel=0
