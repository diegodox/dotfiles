" -----------------------------------------------------------------------------
" lightline status bar settings
" -----------------------------------------------------------------------------

" always show tabline
set showtabline=2

" get rid of command line mode like -- INSERT --
set noshowmode

" use lightline-buffer in lightline
let g:lightline = {
    \ 'tabline': {
    \   'left': [ ['bufferbefore', 'buffercurrent', 'bufferafter' ] ],
    \  'right': [ ['githead', 'sessionname', 'workingdir'] ],
    \ },
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['readonly', 'filepath', 'modified'],
    \             ['cocstatus', 'currentfunction']
    \           ],
    \  'right': [ ['gitgutter'] ]
    \ },
    \ 'inactive': {
    \     'left': [ ['filepath','modified'],
    \               ['cocdiagnostic']
    \             ],
    \    'right': [ ['gitgutter'] ]
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \   'workingdir': 'ShortenCWD',
    \   'filepath': 'FilePath',
    \   'sessionname': 'SessionName',
    \   'githead': 'FugitiveHead',
    \   'gitgutter': 'LightGitGutter',
    \   'cocstatus': 'coc#status',
    \   'cocdiagnostic': 'CocDiagnostic',
    \   'currentfunction': 'CocCurrentFunction',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

function! ShortenCWD()
    return pathshorten(substitute(getcwd(),$HOME,'~',''))
endfunction

function! FilePath()
    return &buftype ==# 'terminal' ? 'Term':
    \ &filetype ==# 'lazygit' ? 'LazyGit':
    \ substitute(expand('%'),getcwd(),'','')
endfunction

function! SessionName()
    return fnamemodify(v:this_session, ':t')
endfunction

function! LightGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 60
        return ''
    endif
    let symbols = [
        \ g:gitgutter_sign_added,
        \ g:gitgutter_sign_modified,
        \ g:gitgutter_sign_removed
        \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
        if hunks[i] > 0
            call add(ret, symbols[i] . hunks[i])
        endif
    endfor
    return join(ret, ' ')
endfunction

function! CocDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' ')
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" lightline-buffer ui settings
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ''

" enable devicons, only support utf-8
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer whether show buffer number
let g:lightline_buffer_show_bufnr = 0

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['3"']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 4

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 0

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20

