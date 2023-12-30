" GENERAL {{{

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Nvim providers
let g:ruby_host_prog = "~/.asdf/installs/ruby/3.1.1/bin/neovim-ruby-host"
let g:node_host_prog = "~/.asdf/installs/nodejs/18.8.0/.npm/bin/neovim-node-host"
let g:python3_host_prog = "~/.asdf/installs/python/3.10.6/bin/python"

" Code completion plugins for CoC
let g:coc_global_extensions = [
      \ "coc-solargraph",
      \ "coc-tsserver"
      \ ]

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
set foldmethod=syntax
set nofoldenable
set updatetime=300
set signcolumn=yes

" Tabs and spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Ignore Rails tmp directory
set wildignore+=*/tmp/*

set tags=./tags

" Disable mouse
set mouse=

" Indents based on file type
filetype indent on

" Enable plugins based on file type
filetype plugin on

" Always copy to system clipboard
set clipboard=unnamed

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

" Tab completion for coc
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

" Jump to definition and usage
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Switch between the last two files
nnoremap <leader><leader> <c-^>

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

" Ranger file navigation
let g:ranger_map_keys = 0
map <Leader>x :RangerWorkingDirectory<CR>
map - :Ranger<CR>

" }}}
" VISUAL {{{
"
" Display extra whitespace
set list listchars=nbsp:¬,tab:»·,trail:·

" Color scheme
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable
colorscheme gruvbox
set background=dark

autocmd VimEnter,ColorScheme * hi! link CocMenuSel PMenuSel
autocmd VimEnter,ColorScheme * hi! link CocSearch Identifier

" Cancel visual line wrapping
set nowrap

" Navigating splits like a boss
set winwidth=100
set winminwidth=5

" NETRW config
let g:netrw_banner = 0
let g:netrw_browse_split = 0

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
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'

" Vim-Ruby code style
let g:ruby_indent_assignment_style = 'variable'


" vim:foldmethod=marker:foldlevel=0
