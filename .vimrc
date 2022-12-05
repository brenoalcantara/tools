"" Visual Settings
syntax on
set ruler
set number
colorscheme monokai

"" Encoding

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Search

set hlsearch
set ignorecase

"" Tabs

set ai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"" Plugins

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'emmetio/emmet'
"" or Plug 'mattn/emmet-vim'
Plug 'nelstrom/vim-markdown-preview'
"" or Plug 'plasticboy/vim-markdown'

call plug#end()

"" NERDTree configuration
  
map <C-n> :NERDTreeToggle<CR>
  
"" Emmet configuration
  
let user_emmet_expandabbr_key = '<c-e>'

"" Markdow Preview configuration

map <leader>p :Mm<CR>

