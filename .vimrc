" ==================================================================
" File:         $HOME/.vimrc
" Based on Sven Guckes .vimrc from Thu Dec 10 02:02:02 CET 1998
" Author:       Sven Guckes guckes@vim.org (guckes@math.fu-berlin.de)
"               <URL:http://www.math.fu-berlin.de/~guckes/sven/>
" ==================================================================

" Use pathogen for plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" use tags file in . or if not present in the closest parent dir
set   tags=tags;/

" smartindent is smarter indent
set   smartindent

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" autowrite: "on" saves a lot of trouble
"set   autowrite

" backup:  backups are for wimps  ;-)
set nobackup

" swap:
set noswapfile
" backspace:  backspaces over autoindent, eol(join) and insert
" start
set backspace=indent,eol,start

" background:  Are we using a "light" or "dark" background?
set background=dark

" compatible with good old vi limits us too much
set nocompatible

" comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
"set   comments=b:#,:%,fb:-,n:>,n:)

" dictionary: english words first
set dictionary=/usr/dict/words,/local/lib/dutch.words

" errorbells: damn this beep!  ;-)
set noerrorbells

" esckeys:    allow usage of cursor keys within insert mode
set esckeys

" formatoptions:  Options for the "text format" command ("gq")
" I need all those options (but 'o')!
set formatoptions=tcrqnl1j

" helpheight: zero disables this.
set helpheight=15


" hidden: Closed buffers are not abandoned but hidden
set   hidden

" hlsearch :  highlight search - show the current search pattern
" This is a nice feature sometimes - but it sure can get in the
" way sometimes when you edit.
set nohlsearch
"
" icon:
set icon

" ignorecase:  ignore the case in search patterns?  NO!
set noignorecase

" iskeyword:  Add the dash ('-'), the dot ('.'), and the '@'
" as "letters" to "words".
" iskeyword=@,48-57,_,192-255   (default)
set iskeyword=@,48-57,_,192-255,-

" keywordprg:  Program to use for the "K" command.
set keywordprg=man\ -s

" laststatus:  show status line? Always!
set laststatus=2

" wmh: By default, Vim displays the current line of each
" minimized file, which (to me) isn't much help and takes
" up too much screen real estate.
set wmh=0

" lazyredraw:  do not update screen while executing macros
set lazyredraw

" magic: use some magic in search patterns?
set magic


" Line numbers please
set number

" report: show a report when N lines were changed.
"   report=0 thus means "show all changes"!
set report=0

" ruler: show cursor position?  Yep!
set ruler

" shiftwidth:  Number of spaces to use for each
"              insertion of (auto)indent.
" -> Typicall filetype dependent, this is just a default
set shiftwidth=2

" shortmess: Kind of messages to show.   Abbreviate them all!
set shortmess=atI

" showcmd: Show current uncompleted command?  Absolutely!
set showcmd

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" showmode: Show the current mode?
set showmode

"       startofline:  no:  do not jump to first character with page
"       commands, ie keep the cursor in the current column.
set nostartofline

" tabstop
set tabstop=2

"
set expandtab

" Remove trailing blanks upon saving except from lines containing sigdashes
" autoremove excess whitespace on :w
function! StripTrailingSpaces()
  "if ( GetVar( "noStripSpaces" ) != 1 )
    let currPos=Mark()
    exec 'v:^--\s*$:s:\s\+$::e'
    exec 'retab'
    exe currPos
  "endif
endfunction
" au BufWritePre * silent! call StripTrailingSpaces()

" do retab before exit -> We are anal about whitespace!
au BufWritePre *.v       silent! exec 'retab'
au BufWritePre *.sv      silent! exec 'retab'
au BufWritePre *.vhd     silent! exec 'retab'
au BufWritePre *.cpp     silent! exec 'retab'
au BufWritePre *.c       silent! exec 'retab'
au BufWritePre *.cpp     silent! exec 'retab'
au BufWritePre *.py      silent! exec 'retab'
au BufWritePre *.sh      silent! exec 'retab'
au BufWritePre *.csh     silent! exec 'retab'
au BufWritePre *.mk      silent! exec 'retab'
au BufWritePre ?akefile* silent! exec 'retab'

" Set the colors for vim on "xterm"
  if has("gui_running") ||  &term=="xterm-color"
    colorscheme solarized
    set guifont=Deja\ Vu\ Sans\ Mono\ 9
    "set guifont=Deja\ Vu\ Sans\ Mono\ For\ Powerline\ 9
  else
    colorscheme solarized
  endif

" Make the backspace work properly in screen termcaps (probably not
" the right place to fix this, but works for now?
"if &term == "screen" || &term == "screen-256color"
"    set t_kb=
"    set t_kD=[3~
"endif

set nowrap

" title
set title

" ttyfast: are we using a fast terminal?
set ttyfast

" ttybuiltin: Give priority to vim's builtin termcaps
set ttybuiltin

" viminfo:  What info to store from an editing session
" in the viminfo file;  can be used at next session.
set viminfo=%,'100,<5000,:100,n~/.viminfo

" visualbell:
set novisualbell

" t_vb:  terminal's visual bell - turned off to make Vim quiet!
" Please use this as to not annoy cow-orkers in the same room.
" Thankyou!  :-)
set t_vb=

" whichwrap:
set whichwrap=<,>,[,]

" wildchar  the char used for "expansion" on the command line
" default value is "<C-E>" but I prefer the tab key:
set wildchar=<TAB>

" wildignore: which files to ignore for expansion
set wildignore="*.o,*.pyc,*.obj

" ===================================================================
" File Browser
" ===================================================================
" hide some files and remove stupid help
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
let g:explDetailedHelp=0
"map  :Explore!<CR>

" ===================================================================
" MAPpings
" ===================================================================
" When I let Vim write the current buffer I frequently mistype the
" command ":w" as ":W" - so I have to remap it to correct this typo:
nmap :W :w
nmap :Wq :wq

" Shortcut to reload vimrc
nn  ,u :source <C-R>=vimrc<CR><CR>

" General Editing
"
" Define "del" char to be the same backspace (saves a LOT of trouble!)
" As the angle notation cannot be use with the LeftHandSide
" with mappings you must type this in *literally*!
map <C-V>127 <C-H>
cmap <C-V>127 <C-H>
" the same for Linux Debian which uses
imap <Esc>[3~ <C-H>
imap        <C-H>

" Shortcut key to build the make file
map <F9> :make<CR>

" ===================================================================
" AutoCommands
" ===================================================================
" just load the main syntax file when Vim was compiled with "+syntax"
  if has("syntax")
    " highlight tabs and trailing spaces
    set list listchars=tab:\|-,trail:.
    highlight Tabs ctermbg=darkred guibg=darkred
    match Tabs /\t/
    highlight WhitespaceEOL ctermbg=darkred guibg=darkred
    match WhitespaceEOL /\s\+\%#\@!$/
  endif

" Powerline plugin settings
let g:Powerline_theme="default"
let g:Powerline_colorscheme="skwp"
let g:Powerline_symbols = 'unicode'

"NERDtree setup
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=1
let NERDTreeShowHidden=1

" Use the mouse as in gvim, I like to use it for
" window resizing.
if has('mouse')
  set mouse=a
  if !has('gui_running')
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

" Restore the cursor to its last known position
" when opening a file. Depends on viminfo keeping
" marks.
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Check if a file changed behind our back
autocmd BufWinEnter * checktime
autocmd FocusGained * checktime
autocmd CursorHold  * checktime

" Setup for ctrlp plugin
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 2000
let g:ctrlp_max_depth = 15
let g:ctrlp_use_caching = 20
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(exe|so|dll|a)$',
  \ }
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ 3: ['.svn', 'cd %s && svn ls -R'],
    \ },
  \ }

" Highlight lines that are overlength
function ToggleOverLengthHi()
    if exists("b:overlengthhi") && b:overlengthhi
        highlight clear OverLength
        let b:overlengthhi = 0
        "echo "overlength highlight off"
    else
        " adjust colors/styles as desired
        highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
        match OverLength /\%>80v.\+/
        let b:overlengthhi = 1
        "echo "overlength highlight on"
    endif
endfunction
map <silent> <F3> <Esc>:call ToggleOverLengthHi()<CR>

" Syntax on
syntax on

" Filetype detection
filetype on
filetype plugin on
filetype indent on

" NeoComplete settings

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_auto_select = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <C-Space>: completion.
inoremap <expr> <C-N> pumvisible() ? "\<C-N>" : "\<C-X><C-U>"

" Limit preview window size for omnicomplete
set previewheight=8

