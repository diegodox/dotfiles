-------------------------------------------------------------------------------
-- telescope coc integration settings
-------------------------------------------------------------------------------

require('telescope').load_extension('coc')
local wk = require("which-key")
wk.register(
    {
        c = {
            name = "coc",
            r = { "<Cmd>Telescope coc references<CR>", "references" },
            l = { "<Cmd>Telescope coc links<CR>", "links" },
            i = { "<Cmd>Telescope coc implementations<CR>", "implementations" },
            c = { "<Cmd>Telescope coc commands<CR>", "coc commands" },
            t = { "<Cmd>Telescope coc type_definitions<CR>", "type definitions" },
            D = { "<Cmd>Telescope coc definitions<CR>", "definitions" },
            d = { "<Cmd>Telescope coc diagnostics<CR>", "diagnostics" },
            s = { "<Cmd>Telescope coc document_symbols<CR>", "document symbols" },
            ["."] = { "<Cmd>Telescope coc code_actions<CR>", "code actions" },
        }
    },
    {
        prefix = "<Space>"
    }
)
wk.register(
    {
        name = "jump",
        r = { "<Cmd>Telescope coc references<CR>", "CoC References" },
        l = { "<Cmd>Telescope coc links<CR>", "CoC Links" },
        i = { "<Cmd>Telescope coc implementations<CR>", "CoC Implementations" },
        t = { "<Cmd>Telescope coc type_definitions<CR>", "CoC Type definitions" },
        d = { "<Cmd>Telescope coc definitions<CR>", "CoC Definitions" },
        ["."] = { "<Cmd>Telescope coc code_actions<CR>", "CoC Code actions" },
    },
    {
        prefix = "g"
    }
)
wk.register(
    {
        name = "jump",
        ["<C-a>"] = { "<Cmd>Telescope coc code_actions<CR>", "code actions" },
    }
)
