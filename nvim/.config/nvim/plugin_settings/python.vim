" -----------------------------------------------------------------------------
" Python lsp (pyright) settings
" -----------------------------------------------------------------------------

"--------------
" pyright settings
"--------------

lua <<EOF
    require'lspconfig'.pyright.setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
EOF

" auto format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil,100)
