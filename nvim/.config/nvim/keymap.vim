" -----------------------------------------------------------------------------
" General (Plugin independent) Keymaps
" -----------------------------------------------------------------------------

" Save file
nnoremap <C-s> :w<CR>

" Go next buffer
nnoremap <silent> <S-n> :bn<CR>
" Go previous buffer
nnoremap <silent> <S-p> :bp<CR>

" Close window
nnoremap <silent> <C-x> :close<CR>

" Move window focus
nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

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

