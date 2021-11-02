" -----------------------------------------------------------------------------
" undo tree settings
" -----------------------------------------------------------------------------

" call :UndotreeToggle to use.

" enable persistundo
let target_path = expand('~/.undodir')

" create the directory and any parent directories
" if the location does not exist.
if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
endif

let &undodir=target_path
set undofile

