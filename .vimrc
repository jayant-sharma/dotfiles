"version 5.3
" ==================================================================
" File:         $HOME/.vimrc
" Availability: This file is available as
"   ~20K        <URL:http://www.math.fu-berlin.de/~guckes/setup/vimrc.gz>
"   ~56K        <URL:http://www.math.fu-berlin.de/~guckes/setup/vimrc>
"               <URL:http://www.vim.org/rc> (mirror)
" Size:         This file is about 57K in size and has 1,500+ lines.
" Purpose:      Setup file for the editor Vim (Vi IMproved)
" Author:       Sven Guckes guckes@vim.org (guckes@math.fu-berlin.de)
"               <URL:http://www.math.fu-berlin.de/~guckes/sven/>
" Related files:
"               http://www.math.fu-berlin.de/~guckes/vim/src/latex.vim
"               http://www.math.fu-berlin.de/~guckes/vim/src/html.vim
"               http://www.math.fu-berlin.de/~guckes/vim/syntax/
" Note:         Please send comments to me - email preferred! :-)
" Last update:  Thu Dec 10 02:02:02 CET 1998
" ===================================================================
" The latest versions of Vim are usually in my signature file:
" http://www.math.fu-berlin.de/~guckes/sig/SIGS  Have a look!
" ===================================================================
" Note to Windows users:  Get these files from any Vim mirror:
"     vim52rt.zip (840K)  vim runtime files (docs + syntax files)
"     gvimw32.zip (440K)  gvim - precompiled binary for Windows 32bit
" These should fit onto one floppy.  Just a recommendation.
" ===================================================================
" Installation of this setup file:
"
"  To use this setup file, copy it to
"  this filename    on these systems:
"    ~/.vimrc       Unix and OS/2
"    s:.vimrc       Amiga
"    $VIM\_vimrc    MS-DOS and Win32
"
" NOTE: This setup file uses a lot of features of Vim-5.
" If you are still using Vim-4 (or an even older version)
" then you should upgrade - it is really worth the effort!
" To find out why get Vim-5 and read ":help version5".
"
" The first line of this setup file contains the information
" "version xxx" which allows VIM to check whether the setup file
" fits the syntax that it understands.
" Versions of VIM other than of version 5 then will give a warning
" as they do not understand this setup file command - a feature:
" Give a warning so the user knows that there is something odd
" about the setup file.
" ===================================================================
" Whitespace meta sequence:
" vim-5.0s introduced the meta sequence "\s" which stands for "whitespace"
" ie either a space or a tab.  This makes mappings a lot easier.
" I have therefore updated my mappings to use this sequence.
" But this is incompatible with previous versions and, of course, Vi.
" ===================================================================
" Info on the latest versions is on the Vim HomePage:
"       http://www.vim.org/ - which is a daily mirror of the pages at
"       http://www.math.fu-berlin.de/~guckes/vim/
" and in Sven's signature file:
" http://www.math.fu-berlin.de/~guckes/sig/SIGS
" ===================================================================
" ===================================================================
" Structure of this file:
" Lines starting with an inverted comma (") are comments.
" Some mappings are commented out.  Remove the comment to enable them.
"
" There are three kinds of things which are defined in this file:
" Mapping ("map"), settings ("set"), and abbreviations ("ab").
"   Settings affect the behaviour of commands.
"   Mappings maps a key sequence to a command.
"   Abbreviations define words which are replaced
"   right *after* they are typed in.
"
" ===================================================================
" Note on mappings - "angle notation" (see ":help <>"):
" VIM allows you to define mappings with special characters
" with a notation that uses non-special characters:
" The notation encloses decriptive words in angle brackets (<>).
" The characters you will most often are:
" <C-M> for control-m
" <C-V> for control-v which quotes the following character
" <ESC> for the escape character.
" All control characters have been replaced to use the angle notation
" so you should be able to read this file without problems.
" (Well, sometimes I leave some tabs [control-i] in the file. ;-)
" ===================================================================
" External programs:
" Some mappings make use of external programs.
" The following you should find on every UNIX system:
" awk, egrep, grep, ispell, perl, sed.
" If you are using DOS then you should get these for you system!!
" Programs that are supplied with the mailer ELM: elmalias, readmsg.
" To get these look at page
" http://www.math.fu-berlin.de/~guckes/elm/dist.html
" One major advantage of vim-5 (actually, 5.0g) is that there is now
" the internal function "strftime".  This allows to insert the current
" date and time in various format.  Example:  mapping ",L" (see below)
" ===================================================================
" SETtings
" ===================================================================
"       Use pathogen for plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"
"       use tags file in . or if not present in the closest parent dir
  set   tags=tags;/
"       do not show the toolbars in gvim
"  set   guioptions=g
"
"       autoindent:
" set   autoindent
"
"       smartindent is smarter indent
  set   smartindent
"
"       autowrite: "on" saves a lot of trouble
  set   autowrite
"
"       Warn if a file is modified outside of vim
"  autocmd FileChangedShell * echo "File changed, need to reload"
"
"       backup:  backups are for wimps  ;-)
  set nobackup
"
"       swap:
  set noswapfile
"       backspace:  backspaces over autoindent, eol(join) and insert
"       start
  set   backspace=indent,eol,start
"
"       background:  Are we using a "light" or "dark" background?
  set   background=dark
"
"       compatible  ....
  set nocompatible
"
"       comments default: sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-
" set   comments=b:#,:%,fb:-,n:>,n:)
"
"       cpoptions you should get to know - source of many FAQs!  ;-)
"       cpoptions:  "compatible options" to match Vi behaviour
" set   cpoptions="aABceFs"   "default!
"       FAQ:  Do NOT include the flag '<' if you WANT angle notation!
"
"       dictionary: english words first
  set   dictionary=/usr/dict/words,/local/lib/dutch.words
"
"       digraph:    required for those umlauts
"  set   digraph
"
"       errorbells: damn this beep!  ;-)
  set noerrorbells

"       esckeys:    allow usage of cursor keys within insert mode
  set   esckeys
"
"       formatoptions:  Options for the "text format" command ("gq")
"                       I need all those options (but 'o')!
  set   formatoptions=cr
"
"       helpheight: zero disables this.
" set   helpheight=0
"
"       helpfile:  filename of the helpfile
" set   helpfile=c:\\vim-4.6\\docs\\help.txt
"       this is where I usually put it on DOS; sometimes is required
"       to set as the default installation does not find it  :-(
"
"       hidden:
  set   hidden
"
"       highlight=8b,db,es,hs,mb,Mn,nu,rs,sr,tb,vr,ws
"  set   highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
"
"       hlsearch :  highlight search - show the current search pattern
"       This is a nice feature sometimes - but it sure can get in the
"       way sometimes when you edit.
  set nohlsearch
"
"       icon:       ...
  set   icon
"
"       ignorecase:  ignore the case in search patterns?  NO!
  set noignorecase
"
"       insertmode:  start in insert mode?  Naah.
  set noinsertmode
"
"
"       iskeyword:  Add the dash ('-'), the dot ('.'), and the '@'
"                   as "letters" to "words".
"       iskeyword=@,48-57,_,192-255   (default)
" set   iskeyword=@,48-57,_,192-255,-,.,@-@
"
"       joinspaces:  insert two spaces after a period with every
"                joining of lines.  This is very nice!
" set   joinspaces
"
"       keywordprg:  Program to use for the "K" command.
  set   keywordprg=man\ -s
"
"       laststatus:  show status line? Always!
  set   laststatus=2
"
"       wmh: By default, Vim displays the current line of each
"       minimized file, which (to me) isn't much help and takes
"       up too much screen real estate.
  set   wmh=0
"
" [VIM5]lazyredraw:  do not update screen while executing macros
  set   lazyredraw
"
"       magic:       use some magic in search patterns?
  set   magic
"
"       modeline:    ...
"       Allow the last line to be a modeline - useful when
"       the last line in sig gives the preferred textwidth for replies.
" set   modeline
" set   modelines=1
"
"       number:      ...
  set   number
"
"       path:   The list of directories to search when you specify
"               a file with an edit command.
"               Note:  "~/.P" is a symlink to my dir with www pages
"               "$VIM/syntax" is where the syntax files are.
" set   path=.,,~/.P/vim,~/.P/vim/syntax,~/.P/vim/source,$VIM/syntax/
" set   path=.,,~/.P/vim,~/.P/mutt/,~/.P/elm,~/.P/slrn/,~/.P/nn
"
"       report: show a report when N lines were changed.
"               report=0 thus means "show all changes"!
  set   report=0
"
"       ruler:       show cursor position?  Yep!
  set   ruler
"
" Setting the "shell" is always tricky - especially when you are
" trying to use the same vimrc on different operatin systems.
"       shell for DOS
" set   shell=command.com
"       shell for UNIX -  math.fu-berlin.de BSD
" set   shell=zsh
"       shell for UNIX -   inf.fu-berlin.de BSD&Solaris
" set   shell=zsh
"       shell for UNIX - zedat.fu-berlin.de BSD&Solaris
" set   shell=/bin/tcsh
"       zsh now available at zedat!  :-)
" set   shell=zsh
" Now that vim-5 has ":if" I am trying to automate the setting:
"
  if has("dos16") || has("dos32")
  let shell='command.com'
  endif
  if has("unix")
  let shell='bash'
  endif
"
"       shiftwidth:  Number of spaces to use for each
"                    insertion of (auto)indent.
  set   shiftwidth=2
"
"       shortmess:   Kind of messages to show.   Abbreviate them all!
"          New since vim-5.0v: flag 'I' to suppress "intro message".
  set   shortmess=at
"
"       showcmd:     Show current uncompleted command?  Absolutely!
  set   showcmd
"
"       showmatch:   Show the matching bracket for the last ')'?
  set   showmatch
"
"       showmode:    Show the current mode?  YEEEEEEEEESSSSSSSSSSS!
  set   showmode
"
"       suffixes:    Ignore filename with any of these suffixes
"                    when using the ":edit" command.
"                    Most of these are files created by LaTeX.
" set   suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar
"
"       startofline:  no:  do not jump to first character with page
"       commands, ie keep the cursor in the current column.
  set nostartofline
"
"       tabstop
  set   tabstop=2
"
"
  set   expandtab
"
"
" autoremove excess whitespace on :w
  function! StripTrailingSpaces()
    "if ( GetVar( "noStripSpaces" ) != 1 )
      let currPos=Mark()
      exec 'v:^--\s*$:s:\s\+$::e'
      exec 'retab'
      exe currPos
    "endif
  endfunction
  " Remove trailing blanks upon saving except from lines containing sigdashes
" au BufWritePre * silent! call StripTrailingSpaces()
"
" do retab before exit
  au BufWritePre *.v   silent! exec 'retab'
  au BufWritePre *.sv  silent! exec 'retab'
  au BufWritePre *.vhd silent! exec 'retab'
  au BufWritePre *.cpp silent! exec 'retab'
  au BufWritePre *.c   silent! exec 'retab'
  au BufWritePre *.cpp silent! exec 'retab'
  au BufWritePre *.py  silent! exec 'retab'
  au BufWritePre *.sh  silent! exec 'retab'
"
"
" Turn hard tabs on for Makefiles only
  autocmd BufEnter ?akefile* set et!
  autocmd BufLeave ?akefile* set et
  autocmd BufEnter *.mk set et!
  autocmd BufLeave *.mk set et
"
" Set the colors for vim on "xterm"
  if has("gui_running") ||  &term=="xterm-color"
    "set bg=dark
    "set t_Co=256        " terminal has eight colors
    "colorscheme inkpot
    colorscheme solarized
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
  else
    colorscheme solarized
    "set bg=dark
    "colorscheme peaksea
    "colorscheme inkpot
  endif
"
" Make the backspace work properly in screen termcaps (probably not
" the right place to fix this, but works for now?
"if &term == "screen" || &term == "screen-256color"
"    set t_kb=
"    set t_kD=[3~
"endif
"
"       textwidth
" set   textwidth=80
"
  set   nowrap
"
"       title
  set   title
"
"       ttyfast:     are we using a fast terminal?
"                    seting depends on where I use Vim...
  set   ttyfast
"
"       ttybuiltin:
  set   ttybuiltin
"
"       ttyscroll:      turn off scrolling -> faster!
" set   ttyscroll=0
"
"       ttytype:
" set   ttytype=rxvt
"
"       viminfo:  What info to store from an editing session
"                 in the viminfo file;  can be used at next session.
  set   viminfo=%,'1000,<500,:100,n~/.viminfo
"
"       visualbell:
  set novisualbell
"
"       t_vb:  terminal's visual bell - turned off to make Vim quiet!
"       Please use this as to not annoy cow-orkers in the same room.
"       Thankyou!  :-)
  set   t_vb=
"
"       whichwrap:
  set   whichwrap=<,>,[,]
"
"       wildchar  the char used for "expansion" on the command line
"                 default value is "<C-E>" but I prefer the tab key:
  set   wildchar=<TAB>
"
"       wildignore: which files to ignore for expansion
  set   wildignore="*.o,*.pyc,*.obj
"
"       wrapmargin:
" set   wrapmargin=1
"
"       writebackup:
" set nowritebackup
"
"       Cscope and ctags settings
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
      set csverb
endif

" ===================================================================
" File Browser
" ===================================================================
" hide some files and remove stupid help
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
let g:explDetailedHelp=0
map  :Explore!<CR>
"
" ===================================================================
" MAPpings
" ===================================================================
" Caveat:  Mapping must be "prefix free", ie no mapping must be the
" prefix of any other mapping.  Example:  "map ,abc foo" and
" "map ,abcd bar" will give you the error message "Ambigous mapping".
"
" The backslash ('\') is the only(?) unmapped key, so this is the best
" key to start mappings with as this does not take away a command key.
" However, the backslash is never in the same position with keyboards.
" Eg on German keyboards it is AltGr-sz - don't ask.
" Anyway, I have decided to start mappings with the comma as this
" character is always on the same position on almost all keyboards
" and I hardly have a need for that command.
"
" The following maps get rid of some basic problems:
"
" When I let Vim write the current buffer I frequently mistype the
" command ":w" as ":W" - so I have to remap it to correct this typo:
  nmap :W :w
"       When you edit multiple files, you often need to change
"       windows. You can set up vim in windows and gvim to switch
"       between windows with the commonly used Ctrl-Tab and
"       Ctrl-Shift-Tab. The mappings:
nmap <C-Tab> <C-w>w
nmap <C-S-Tab> <C-w>W
"
" ===================================================================
" Customizing the command line
" ===================================================================
" Valid names for keys are:  <Up> <Down> <Left> <Right> <Home> <End>
" <S-Left> <S-Right> <S-Up> <PageUp> <S-Down> <PageDown>  <LeftMouse>
"
" Make the up and down movements move by "display/screen lines":
"      map j      gj
"      map <Down> gj
"      map k      gk
"      map <Up>   gk
"
" ===================================================================
" VIM - Editing and updating the vimrc:
" As I often make changes to this file I use these commands
" to start editing it and also update it:
  if has("unix")
    let vimrc='~/.vimrc'
  else
" ie:  if has("dos16") || has("dos32") || has("win32")
    let vimrc='$VIM\_vimrc'
  endif
  nn  ,u :source <C-R>=vimrc<CR><CR>
  nn  ,v :edit   <C-R>=vimrc<CR><CR>
"     ,v = vimrc editing (edit this file)
" map ,v :e ~/.vimrc<CR>
"     ,u = "update" by reading this file
" map ,u :source ~/.vimrc<CR>
" ===================================================================
"
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
"
" ===================================================================
" HTML - HTML - HTML - HTML - HTML - HTML - HTML - HTML
" ===================================================================
" This has become quite big - so I moved it out to another file:
" http://www.math.fu-berlin.de/~guckes/vim/source/html.vim [980227]
"  source /usr/local/share/vim/source/html.vim
"
" ===================================================================
" LaTeX - LaTeX - LaTeX - LaTeX - LaTeX - LaTeX - LaTeX
" ===================================================================
" This has become quite big - so I moved it out to another file:
" http://www.math.fu-berlin.de/~guckes/vim/source/latex.vim
" source ~guckes/.P/vim/source/latex.vim
"
" ===================================================================
" python support
" ===================================================================
" don't highlight exceptions and builtins. I love to override them in
" local scopes and it sucks ass if it's highlighted then. And for
" exceptions I  don't really want to have different colors for my own
" exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let python_highlight_all=1
"let python_highlight_exceptions=0
"let python_highlight_builtins=0
"
" ===================================================================
" C/C++ support
" ===================================================================
autocmd FileType C setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 cindent
" ===================================================================
" SystemVerilog: use verilog highlghting
" ===================================================================
au BufNewFile,BufRead *.sv                       setf verilog
au BufNewFile,BufRead *.scs                      setf spectre
" ===================================================================
" AutoCommands
" ===================================================================
"
" Autocommands are the key to "syntax coloring".
" There's one command in your vimrc that should
" load/source the file $VIM/syntax/syntax.vim
" which contains the definition for colors and
" the autocommands that load other syntax files
" when necessary, ie when the filename matches
" a given pattern, eg "*.c" or *".html".
"
" just load the main syntax file when Vim was compiled with "+syntax"
  if has("syntax")
    " define my own syntax file (to be sourced t the end of syntax.vim):
    let mysyntaxfile="~debackep/.vim/syntax/syntax.vim"
    " URL: http://www.math.fu-berlin.de/~guckes/vim/syntax/syntax.vim
    " The main/standard syntax file: should be so'd by default
    "  so $VIM/vimcurrent/syntax/syntax.vim
    " hi! Comment  term=bold  ctermfg=cyan  guifg=Blue
    " highlight tabs and trailing spaces
    set list listchars=tab:\|-,trail:.
    highlight Tabs ctermbg=darkred guibg=darkred
    match Tabs /\t/
    highlight WhitespaceEOL ctermbg=darkred guibg=darkred
    match WhitespaceEOL /\s\+\%#\@!$/
  endif
"
"
" EXAMPLE: Restricting mappings to some files only:
" An autocommand does the macthign on the filenames -
" but abbreviations are not expanded within autocommands.
" Workaround:  Use "exe" for expansion:
" let aucommand = "au BufNewFile,BufRead ".MAILNEWSFILES
" exe aucommand." :map ,hi 1G}oHi!<CR><ESC>"
" exe aucommand." :map ,ha 1G}oHello, again!<CR><ESC>"
" exe aucommand." :map ,H G/Quoting /e+1<CR>ye1G}oHallo, !<ESC>Po<ESC>"
" exe aucommand." :map ,re 1G}oRe!<CR><ESC>"
"
" Automatically place the cursor onto the first line of the mail body:
" autocmd BufNewFile,BufRead MAILNEWSFILES :normal 1G}j
"
" Toggle syntax coloring on/off with "__":
" nn __ mg:if has("syntax_items")<Bar>syn clear<CR>else<Bar>syn on<CR>en<CR>`g
" Note:  It works - but the screen flashes are quite annoying.  :-/
"
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
"
" ===================================================================
" If your read this...
" ===================================================================
" ... then please send me an email!  Thanks!  --Sven guckes@vim.org
" I have received some emails so far - thanks, folks!
" Enjoy Vim!  :-)
" ===================================================================
" Yet another example for an autocommand:  [980616]
" au VimLeave * echo "Thanks for using Vim"version". --Sven Guckes@vim.org!"
" ===================================================================
" Last but not least...
" =====================================================
" The last line is allowed to be a "modeline" with my setup.
" It gives vim commands for setting variable values that are
" specific for editing this file.  Used mostly for setting
" the textwidth (tw) and the "shiftwidth" (sw).
" Note that the colon within the value of "comments" needs to
" be escaped with a backslash!  (Thanks, Thomas!)
"       vim:tw=70 et sw=4 comments=\:\"
