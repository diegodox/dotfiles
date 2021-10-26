" -----------------------------------------------------------------------------
" General (Plugin independent) Keymaps
" -----------------------------------------------------------------------------

" Save file
nnoremap <C-s> <Cmd>write<CR>

" Go next buffer
nnoremap <silent> <S-n> <Cmd>bn<CR>
" Go previous buffer
nnoremap <silent> <S-p> <Cmd>bp<CR>

" Close window
nnoremap <silent> <C-x> <Cmd>close<CR>

" Move window focus
nnoremap <silent> <S-h> <Cmd>wincmd h<CR>
nnoremap <silent> <S-j> <Cmd>wincmd j<CR>
nnoremap <silent> <S-k> <Cmd>wincmd k<CR>
nnoremap <silent> <S-l> <Cmd>wincmd l<CR>

" Alternative for ESC
" Ctrl+k as Esc and set IME English
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <Esc>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>
" Disable Esc
nnoremap <Esc> <nop>
inoremap <Esc> <nop>
vnoremap <Esc> <nop>
snoremap <Esc> <nop>
xnoremap <Esc> <nop>
cnoremap <Esc> <nop>
onoremap <Esc> <nop>
lnoremap <Esc> <nop>
tnoremap <Esc> <nop>

" Disable Allow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Move displayied line
nnoremap k gk
nnoremap j gj

