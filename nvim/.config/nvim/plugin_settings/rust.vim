" -----------------------------------------------------------------------------
" Rust settings (rust-analyzer(lsp), rust-tools)
" -----------------------------------------------------------------------------

"--------------
" lsp settings
"--------------

lua <<EOF
    require'lspconfig'.rust_analyzer.setup{
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    require'rust-tools'.setup({
        server = {
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                    -- enable clippy diagnostics on save
                    checkOnSave = {
                        command = "clippy"
                    }
                },
            }
        }
    })
EOF

" auto format
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil,100)
