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
    set guifont=Deja\ Vu\ Sans\ Mono\ Book\ 9
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

" ===================================================================
" ASCII tables - you may need them some day.  Save them to a file!
" ===================================================================
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
"
" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================

