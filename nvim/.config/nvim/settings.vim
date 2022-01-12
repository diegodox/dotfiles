"------------------------------------------------------------------------------
" General neovim Settings
"------------------------------------------------------------------------------

syntax enable
filetype plugin indent on
set title " set window title as buffer name
set hidden
set encoding=utf-8
set fileencoding=utf-8
set pumheight=10 " Popup menu height
set ruler
set splitbelow
set splitright
set conceallevel=0 " So that I can see `` in  markdown files
set tabstop=4 " Insert 4 spaces for a tab
set shiftwidth=4 " The number of space charactres inserted for indatation
set smarttab
set expandtab " Converts tabs to spaces
set autoindent
set number relativenumber
set clipboard=unnamedplus " Copy paste with system clipboard
set updatetime=300 " Faster completion
set noshowmode " Airline can show mode
set mouse=a
set iskeyword+=- " Treat dash separatd words as a word text object
set colorcolumn=80
set backspace=indent,eol,start " Enable backspace to delete these (in insert mode)
set nowrap
set ignorecase
set smartcase
set scrolloff=5
set signcolumn=yes

" ----------------
" guivim settings
" ----------------
set guifont=Hack\ Nerd\ Font,Noto\ Sans\ Mono\ CJK\ JP:h13

