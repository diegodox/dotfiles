" -----------------------------------------------------------------------------
" ranger vim integration
" -----------------------------------------------------------------------------

" disable ranger default keymap
let g:ranger_map_keys = 0
" use ranger when open dir
let g:ranger_replace_netrw = 1 

" <C-b> to toggle ranger
nnoremap <silent> <C-b> :Ranger<CR>
tnoremap <silent> <C-b> q<CR>

