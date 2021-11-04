" -----------------------------------------------------------------------------
" Vim script settings
" -----------------------------------------------------------------------------

" --------------------
" vim script lsp settings
" --------------------

" Set-up lsp
lua <<EOF
    require'lspconfig'.vimls.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
EOF

" Auto format with lsp
autocmd BufWritePre *.vim lua vim.lsp.buf.formatting_sync(nil,100)

