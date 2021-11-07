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
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml)
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

source $HOME/.config/nvim/plugin_settings/coc.vim
" In Vim initializing, you must call the "hook_post_source" hooks manually
" in VimEnter if needed.
autocmd VimEnter * call dein#call_hook('post_source')

" Load general plugin settings
luafile $HOME/.config/nvim/plugin_settings/which_key.lua
source $HOME/.config/nvim/plugin_settings/telescope.vim
source $HOME/.config/nvim/plugin_settings/lightline.vim
source $HOME/.config/nvim/plugin_settings/undotree.vim
source $HOME/.config/nvim/plugin_settings/startify.vim

