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

" Install Uninstalled PlugIn
if dein#check_install()
    call dein#install()
endif

" Load general plugin settings
luafile $HOME/.config/nvim/plugin_settings/which_key.lua
source $HOME/.config/nvim/plugin_settings/bclose.vim
source $HOME/.config/nvim/plugin_settings/gruvbox.vim
source $HOME/.config/nvim/plugin_settings/ranger.vim
source $HOME/.config/nvim/plugin_settings/router.vim
source $HOME/.config/nvim/plugin_settings/winresizer.vim
source $HOME/.config/nvim/plugin_settings/treesitter.vim
source $HOME/.config/nvim/plugin_settings/telescope.vim
source $HOME/.config/nvim/plugin_settings/lazygit.vim
source $HOME/.config/nvim/plugin_settings/lightline.vim
source $HOME/.config/nvim/plugin_settings/indentguides.vim
source $HOME/.config/nvim/plugin_settings/undotree.vim
source $HOME/.config/nvim/plugin_settings/startify.vim

" Load lsp settings
source $HOME/.config/nvim/plugin_settings/lsp.vim

" Load file type settings
source $HOME/.config/nvim/plugin_settings/python.vim
source $HOME/.config/nvim/plugin_settings/rust.vim
source $HOME/.config/nvim/plugin_settings/tex.vim

