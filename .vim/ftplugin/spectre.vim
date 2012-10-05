" Vim filetype plugin file
" Language:	Spectre

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

au BufNewFile,BufRead *.scs                      setf spectre


