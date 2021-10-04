" -----------------------------------------------------------------------------
" TeX settings
" -----------------------------------------------------------------------------

" --------------------
" texlab lsp settings
" --------------------

" Set-up lsp
lua <<EOF
    require'lspconfig'.texlab.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
EOF

" Auto format with lsp
autocmd BufWritePre *.tex lua vim.lsp.buf.formatting_sync(nil,100)

" ------------------
" file type setting
" ------------------
autocmd FileType tex setlocal wrap
