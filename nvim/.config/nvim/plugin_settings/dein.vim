" -----------------------------------------------------------------------------
" dein.vim plugin manager
" -----------------------------------------------------------------------------

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" install dein if not installed
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:cui_toml = fnamemodify(expand('<sfile>'), ':h').'/cui_plugin.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml)
    " Add cui plugins if running in cui
    if !has('gui_running')
        call dein#load_toml(s:cui_toml)
    endif
    call dein#end()
    call dein#save_state()
endif

" non lazy plugins' dein-options-hook_source cannot be called.
" You must call it by dein#call_hook() if needed.
call dein#call_hook('source')

" Install Uninstalled PlugIn
if dein#check_install()
    call dein#install()
endif

" In Vim initializing, you must call the "hook_post_source" hooks manually
" in VimEnter if needed.
autocmd VimEnter * call dein#call_hook('post_source')

colorscheme codedark
