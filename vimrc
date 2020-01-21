" GENERAL {{{

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set modelines=1   " Allow last line of the file to be modeline
set foldmethod=manual
set nofoldenable

" Tabs and spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Autocomplete for command menu
set wildmenu

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Ignore Rails tmp directory
set wildignore+=*/tmp/*

set tags=./tags

" Disable mouse
set mouse=

" Run tests in tmux
let test#strategy = "dispatch"

" Indents based on file type
filetype plugin indent on

" Always copy to system clipboard
set clipboard=unnamedplus

" }}}
" KEY BINDINGS {{{
"
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" FZF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-o> :Buffers<CR>

" Leader
let mapleader = " "

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)

" Better buffer close
map <Leader>g :BD<CR>
map <Leader>d :bd<CR>

" Exuction of current ruby buffer
nnoremap <Leader>r :read !clear; ruby %<CR>

" Rename currently opened file
map <Leader>n :call RenameFile()<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,b
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<CR>

" Open :Ex
map <C-s> <esc>:Explore<CR>

" Index ctags from any project, including those outside Rails
noremap <Leader>ct :!ctags -R --exclude=.git --exclude=node_modules --fields=+l<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-rspec mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>s :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Better saving
map <C-q> <esc>:w<CR>
imap <C-q> <esc>:w<CR>

" Open tabs
map <C-t> <esc>:tabnew<CR>
imap <C-t> <esc>:tabnew<CR>

" Close last open split/tab/window
map <C-x> <C-w>c

" Search for string patterns inside files
map <Leader>a :Ag

" }}}
" VISUAL {{{
"
" Load colorscheme from config file
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Display extra whitespace
set list listchars=nbsp:¬,tab:»·,trail:·

" Color scheme
syntax enable

" Cancel visual line wrapping
set nowrap

" Navigating splits like a boss
set winwidth=100
set winminwidth=5

" NETRW config
let g:netrw_banner = 0
let g:netrw_browse_split = 0

" Disable ALE highlights
let g:ale_set_highlights = 0

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

" Remove trailing whitespace on save for files.
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.css.scss :%s/\s\+$//e

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

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
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" ALE Syntax checkers
let g:ale_linters = {
\   'ruby': ['rubocop']
\}

" vim:foldmethod=marker:foldlevel=0
