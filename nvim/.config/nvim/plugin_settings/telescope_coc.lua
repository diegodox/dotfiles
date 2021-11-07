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
            c = { "<Cmd>Telescope coc commands<CR>", "coc commands" },
            t = { "<Cmd>Telescope coc definitions<CR>", "type definitions" },
            D = { "<Cmd>Telescope coc definitions<CR>", "definitions" },
            d = { "<Cmd>Telescope coc diagnostics<CR>", "diagnostics" },
            s = { "<Cmd>Telescope coc document_symbols<CR>", "document symbols" },
            a = { "<Cmd>Telescope coc code_actions<CR>", "code actions" },
        }
    },
    {
        prefix = "<Space>"
    }
)
wk.register(
    {
        name = "jump",
        r = { "<Cmd>Telescope coc references<CR>", "references" },
        l = { "<Cmd>Telescope coc links<CR>", "links" },
        c = { "<Cmd>Telescope coc commands<CR>", "coc commands" },
        t = { "<Cmd>Telescope coc definitions<CR>", "type definitions" },
        D = { "<Cmd>Telescope coc definitions<CR>", "definitions" },
        d = { "<Cmd>Telescope coc diagnostics<CR>", "diagnostics" },
        s = { "<Cmd>Telescope coc document_symbols<CR>", "document symbols" },
        a = { "<Cmd>Telescope coc code_actions<CR>", "code actions" },
    },
    {
        prefix = "g"
    }

)
