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
        c = {
            name = "coc",
            r = { "<Cmd>Telescope coc references<CR>", "references" },
            l = { "<Cmd>Telescope coc links<CR>", "links" },
            c = { "<Cmd>Telescope coc commands<CR>", "coc commands" },
            t = { "<Cmd>Telescope coc definitions<CR>", "type definitions" },
            D = { "<Cmd>Telescope coc definitions<CR>", "definitions" },
            d = { "<Cmd>Telescope coc diagnostics<CR>", "diagnostics" },
            s = { "<Cmd>Telescope coc document_symbols<CR>", "document symbols" },
            a = { "<Cmd>Telescope coc code_actions<CR>", "actions" },
        }
    },
    {
        prefix = "<Space>"
    }
)

-- buildin features
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>lua require"telescope.builtin".find_files({ prompt_prefix = "🔍", hidden = true })<CR>', {noremap = true, silent = true})

-- telescope-project
vim.api.nvim_set_keymap('n', '<M-p>', '<Cmd>lua require"telescope".extensions.project.project{}<CR>', {noremap = true, silent = true})

EOF

