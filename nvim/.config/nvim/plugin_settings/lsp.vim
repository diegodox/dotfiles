" -----------------------------------------------------------------------------
" LSP settings
" -----------------------------------------------------------------------------

" Use completion-nvim in every buffer
"autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
"set shortmess+=c

" completion-nvim doesn't trigger completion on delete by default, enable it by
"let g:completion_trigger_on_delete = 1

" code action
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" key bindings
"imap <silent> <C-Space> <Plug>(completion_trigger)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.goto_next()<CR>
nnoremap <silent> <C-.> <cmd>lua vim.lsp.buf.code_action()<CR>

" source each lang lsp
source $HOME/.config/nvim/plugin_settings/complete.vim

