" -----------------------------------------------------------------------------
" indent guide settings
" -----------------------------------------------------------------------------
let g:indent_guides_exclude_filetypes = ['help']
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
autocmd VimEnter * IndentGuidesEnable
