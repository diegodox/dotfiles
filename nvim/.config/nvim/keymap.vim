" -----------------------------------------------------------------------------
" General (Plugin independent) Keymaps
" -----------------------------------------------------------------------------

" Save file
nnoremap <C-s> <Cmd>write<CR>

" Go next buffer
nnoremap <silent> <S-n> <Cmd>bn<CR>
" Go previous buffer
nnoremap <silent> <S-p> <Cmd>bp<CR>

" Move window focus
nnoremap <silent> <S-h> <Cmd>wincmd h<CR>
nnoremap <silent> <S-j> <Cmd>wincmd j<CR>
nnoremap <silent> <S-k> <Cmd>wincmd k<CR>
nnoremap <silent> <S-l> <Cmd>wincmd l<CR>


" Disable Allow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Move displayied line
nnoremap k gk
nnoremap j gj

