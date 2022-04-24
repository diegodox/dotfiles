" -----------------------------------------------------------------------------
" VIMRC
" -----------------------------------------------------------------------------

" Load dein plugin manager and each plugin settings
source $HOME/.config/nvim/plugin_settings/dein.vim

" Load custom command
source $HOME/.config/nvim/commands.vim

" Load general Keymap
source $HOME/.config/nvim/keymap.vim

" Load general editor settings
source $HOME/.config/nvim/settings.vim

if exists('g:neovide')
    let g:neovide_transparency=0.9
    highlight StartifyPath guibg=none
    highlight WarningMsg guibg=none
    highlight Error guibg=none
else
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
    highlight EndOfBuffer ctermbg=none guibg=none
    highlight VertSplit ctermbg=none guibg=none
    highlight SignColumn ctermbg=none guibg=none
    highlight SpecialKey ctermbg=none guibg=none
    highlight WarningMsg ctermbg=none guibg=none
    highlight Error ctermbg=none guibg=none
    highlight clear LineNr
    highlight LineNr ctermfg=none guifg=none
    highlight StartifyPath ctermbg=none guibg=none
endif

