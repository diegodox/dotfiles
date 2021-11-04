" -----------------------------------------------------------------------------
" completion settings (hrsh7th/nvim-cmp)
" -----------------------------------------------------------------------------

lua <<EOF
    local cmp = require'cmp'

    -- rust-tools options
    local rust_tool = { 
         
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
          
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,
          
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

             -- The color of the hints
            highlight = "Comment",
        },

    }

    cmp.setup({
        tools = rust_tool,

        completion = {
            autocomplete = {
                cmp.TriggerEvent.TextChanged,
                cmp.TriggerEvent.InsertEnter,
            },
            completeopt = "menu,menuone,noinsert,noselect",
        },

        snippet = { 
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },

        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-u>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete({ 'n', 'i'}),
            ['<C-k>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        },
        
        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "nvim_lua" },
        }
    })
EOF

