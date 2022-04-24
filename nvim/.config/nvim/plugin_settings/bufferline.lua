-------------------------------------------------------------------------------
-- bufferline.nvim settings
-------------------------------------------------------------------------------

-- need termguicolors enable to display proper color on terminal vim
vim.opt.termguicolors = true

local bufferline_bg = '#282828'
local buffer_bg = '#1e1e1e'
local background_focus = '#777777'
local text = '#d4d4d4'
local gray_text = '#808080'

-- settings
require('bufferline').setup({
    options = {
        -- separator_style = 'slant', -- triangle separator
        separator_style = 'thick',
        show_close_icon = false,
        show_buffer_close_icons = false,
        custom_areas = {
            -- left top text
            --  branch_name
            left = function()
                local result = {}
                local branch_name = vim.fn.FugitiveHead()

                if not branch_name then
                    os.execute('notify-send "Please install Fugitive"')
                elseif branch_name ~= '' then
                    table.insert(result, {text = '  ', guifg = '#d7ba7d', guibg = bufferline_bg})
                    table.insert(result, {text = branch_name..' ', guifg = text, guibg = bufferline_bg})
                end

                return result
            end,
            -- right top text
            -- session@cwd
            right = function()
                local result = {}

                local session_name = vim.fn.fnamemodify(vim.v.this_session, ':t')
                table.insert(result, {text = session_name, guifg = text, guibg = bufferline_bg})

                local cwd = vim.fn.pathshorten(vim.fn.substitute(vim.fn.getcwd(), os.getenv("HOME"), '~', ''))
                table.insert(result, {text = '@', guifg = '#d7ba7d', guibg = bufferline_bg})
                table.insert(result, {text = cwd, guifg = text, guibg = bufferline_bg})

                return result
            end,
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        },
        -- todo: remove line bellow
        -- diagnostics = false,
        groups = {
            items = {
                {
                    name = "lua",
                    matcher = function(buf)
                        return buf.filename:match('%.lua')
                    end,
                },
                {
                    name = "Dev",
                    matcher = function(buf)
                        -- return buf is under dev/
                        return buf.filename:match('^dev/')
                    end,
                }
            }
        },
    },
    highlights = {
        -- highlight for background of bufferline
        fill = {
            guibg = bufferline_bg
        },
        duplicate = {
            guifg = gray_text,
            guibg = buffer_bg,
            gui = "italic",
        },
        separator = {
            guifg = bufferline_bg,
            guibg = buffer_bg
        },
        modified = {
            guibg = buffer_bg
        },
        background = {
            guifg = gray_text, -- background tab's name color
            guibg = buffer_bg -- background tab's background color
        },
        duplicate_visible = {
            guifg = gray_text,
            guibg = buffer_bg,
            gui = "italic",
        },
        separator_visible = {
            guifg = bufferline_bg,
            guibg = buffer_bg
        },
        buffer_visible = {
            guifg = text, -- visible tab's name color
            guibg = buffer_bg -- background tab's background color
        },
        modified_visible = {
            guibg = buffer_bg
        },
        duplicate_selected = {
            guifg = text,
            guibg = background_focus,
            gui = "italic",
        },
        separator_selected = {
            guifg = bufferline_bg,
            guibg = background_focus
        },
        buffer_selected = {
            guifg = '#ffffff', -- selected tab's name color
            guibg = background_focus -- selected tab's background color
        },
        modified_selected = {
            guibg = background_focus
        },
    },
})

