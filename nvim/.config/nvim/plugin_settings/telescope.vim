" -----------------------------------------------------------------------------
" Telescope settings
" -----------------------------------------------------------------------------

lua <<EOF
local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        file_ignore_patterns = {
            ".git/.*",
            ".npm/.*"
        },
        preview = {
            filesize_limit = 10
        }
    },
}

-- register whichkey
local wk = require("which-key")
wk.register(
    {
        t = {
            name = "telescope", -- optional group name
            b = { "<Cmd>Telescope buffers<CR>", "List buffers" },
            ["<C-b>"] = { "<Cmd>Telescope builtin<CR>", "List telescope buitin" },
            f = { "<Cmd>Telescope find_files<CR>", "Find File" }, -- create a binding with label
            g = { "<Cmd>Telescope live_grep<CR>", "Grep Line" }, -- create a binding with label
            r = { "<Cmd>Telescope oldfiles<CR>", "Open Recent File" }, -- additional options for creating the keymap
        },
    },
    {
        prefix = "<Space>"
    }
)

-- buildin features
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>lua require"telescope.builtin".find_files({ prompt_prefix = "🔍", hidden = true })<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-p>', '<Cmd>lua require"telescope.builtin".buffers({ prompt_prefix = "🔍", hidden = true })<CR>', {noremap = true, silent = true})

EOF

