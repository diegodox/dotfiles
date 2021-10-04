" -----------------------------------------------------------------------------
" gruvbox color scheme settings
" -----------------------------------------------------------------------------

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

"hi! link SyntasticErrorSign GruvboxRedSign
"hi! link SyntasticWarningSign GruvboxYellowSign

colorscheme gruvbox
set background=dark
