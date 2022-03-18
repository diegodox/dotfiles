" -----------------------------------------------------------------------------
" rnvimr ranger file manager settings
" -----------------------------------------------------------------------------

" <C-b> to open ranger in proper size(rnvimr_ranger_views[1])
nnoremap <silent> <C-b> <Cmd>RnvimrToggle<CR><Cmd>RnvimrResize 1<CR>

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1
" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.85 * &columns)),
            \ 'height': float2nr(round(0.85 * &lines)),
            \ 'col': float2nr(round(0.075 * &columns)),
            \ 'row': float2nr(round(0.075 * &lines)),
            \ 'style': 'minimal'
            \ }
" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

