" ==================================================================
" File:         $HOME/.vimrc
" Based on Sven Guckes .vimrc from Thu Dec 10 02:02:02 CET 1998
" Author:       Sven Guckes guckes@vim.org (guckes@math.fu-berlin.de)
"               <URL:http://www.math.fu-berlin.de/~guckes/sven/>
" ==================================================================

" Use pathogen for plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" use tags file in . or if not present in the closest parent dir
set   tags=tags;/

" smartindent is smarter indent
set   smartindent

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
set formatoptions=cr

" helpheight: zero disables this.
set helpheight=15


" hidden:
"set   hidden

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

" Turn hard tabs on for Makefiles only
autocmd BufEnter ?akefile* set et!
autocmd BufLeave ?akefile* set et
autocmd BufEnter *.mk set et!
autocmd BufLeave *.mk set et
"
" Set the colors for vim on "xterm"
  if has("gui_running") ||  &term=="xterm-color"
    colorscheme solarized
    set guifont=Deja\ Vu\ Sans\ Mono\ 9
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

" ===================================================================
" python support
" ===================================================================
" don't highlight exceptions and builtins. I love to override them in
" local scopes and it sucks ass if it's highlighted then. And for
" exceptions I  don't really want to have different colors for my own
" exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0

" ===================================================================
" C/C++ support
" ===================================================================
autocmd FileType C setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 cindent

" ===================================================================
" SystemVerilog: use verilog highlghting
" ===================================================================
" FIXME: not the place for this?
au BufNewFile,BufRead *.sv                       setf verilog
au BufNewFile,BufRead *.scs                      setf spectre

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

" Filetype detection
filetype on
filetype plugin on
filetype indent on
