" -----------------------------------------------------------------------------
" winresizer, better window resizing settings
" -----------------------------------------------------------------------------

let g_winresizer_enable = 1
let g:wiresizer_finish_with_escape = 1

nnoremap <C-e> <nop>

" Exapand window size to left
nnoremap <silent> <M-h> :WinResizerStartResize<CR>h<Esc>
" Exapand window size to down
nnoremap <silent> <M-j> :WinResizerStartResize<CR>j<Esc>
" Exapand window size to up
nnoremap <silent> <M-k> :WinResizerStartResize<CR>k<Esc>
" Exapand window size to rihgt
nnoremap <silent> <M-l> :WinResizerStartResize<CR>l<Esc>
