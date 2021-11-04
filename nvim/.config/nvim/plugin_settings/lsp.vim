" -----------------------------------------------------------------------------
" nvim buildin LSP settings
" -----------------------------------------------------------------------------

" code action
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" key bindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <C-r> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-S-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-S-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-t> <cmd>lua vim.lsp.buf.code_action()<CR>

" source complete setting
source $HOME/.config/nvim/plugin_settings/complete.vim

"lua <<EOF
"    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"        vim.lsp.diagnostic.on_publish_diagnostics, {
"            -- Enable underline, use default values
"            underline = true,
"             -- Enable virtual text, override spacing to 4
"            virtual_text = {
"                spacing = 4,
"            },
"            update_in_insert = true,
"        }
"    )
"EOF
