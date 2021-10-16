" -----------------------------------------------------------------------------
" startify start up page settings
" -----------------------------------------------------------------------------

" enable auto save session on quit vim
let g:startify_session_persistence = 1

" no AA for start page
let g:startify_custom_header = []

" list of start page
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

