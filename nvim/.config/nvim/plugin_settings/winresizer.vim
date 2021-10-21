" -----------------------------------------------------------------------------
" winresizer, better window resizing settings
" -----------------------------------------------------------------------------

let g_winresizer_enable = 1
let g:wiresizer_finish_with_escape = 1

" Disable winresizer toggle key
let g:winresizer_start_key = '<nop>'

" Exapand window size to left
nnoremap <silent> <M-h> :silent WinResizerStartResize<CR>h<Esc>
" Exapand window size to down
nnoremap <silent> <M-j> :silent WinResizerStartResize<CR>j<Esc>
" Exapand window size to up
nnoremap <silent> <M-k> :silent WinResizerStartResize<CR>k<Esc>
" Exapand window size to rihgt
nnoremap <silent> <M-l> :silent WinResizerStartResize<CR>l<Esc>
