" -----------------------------------------------------------------------------
" Telescope settings
" -----------------------------------------------------------------------------

lua <<EOF
require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            ".git/.*",
            ".npm/.*"
        },
        preview = {
            filesize_limit = 10
        }
    },

    -- telescope-project
    extensions = {
        project = {
            hidden_files = true
        }
    }
}

-- buildin features
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>lua require"telescope.builtin".find_files({ prompt_prefix = "🔍", hidden = true })<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Sp>', '<Cmd>lua require"telescope.builtin".which_key()<CR>', {noremap = true, silent = true})

-- telescope-project
vim.api.nvim_set_keymap('n', '<M-p>', '<Cmd>lua require"telescope".extensions.project.project{}<CR>', {noremap = true, silent = true})

EOF

