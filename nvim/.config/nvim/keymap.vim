" -----------------------------------------------------------------------------
" General (Plugin independent) Keymaps
" -----------------------------------------------------------------------------

" Save file
nnoremap <C-s> <Cmd>write<CR>

" Close vim
nnoremap <C-q><CR> <Cmd>quitall<CR>
nnoremap <C-q>w<CR> <Cmd>wqa<CR>
nnoremap <C-q><S-q><CR> <Cmd>quitall!<CR>

" Go next buffer
nnoremap <silent> <S-n> <Cmd>bn<CR>
" Go previous buffer
nnoremap <silent> <S-p> <Cmd>bp<CR>

" Move window focus
nnoremap <silent> <C-h> <Cmd>wincmd h<CR>
nnoremap <silent> <C-j> <Cmd>wincmd j<CR>
nnoremap <silent> <C-k> <Cmd>wincmd k<CR>
nnoremap <silent> <C-l> <Cmd>wincmd l<CR>

" Scroll like mouse wheel
nnoremap <S-h> 3zh
nnoremap <S-j> 3<C-e>
nnoremap <S-k> 3<C-y>
nnoremap <S-l> 3zl

" Keep highlighted while changing indent
vnoremap > >gv
vnoremap < <gv

" Use <C-Space> to Move from Insert to Normal mode on Terminal mode
tnoremap <C-Space> <C-\><C-n>

" Disable Allow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Move displayied line
nnoremap k gk
nnoremap j gj

" Disable IME with <Esc>
nnoremap <silent> <Esc> <cmd>silent call system('fcitx5-remote -o > /dev/null 2>&1')<CR><Esc>
inoremap <silent> <Esc> <cmd>silent call system('fcitx5-remote -o > /dev/null 2>&1')<CR><Esc>

" Open file in split window
nnoremap gF <C-w>F
