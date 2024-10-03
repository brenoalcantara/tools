"" Visual Settings
syntax on
set ruler
set number
set colorcolumn=80
set signcolumn=yes
set cmdheight=2
set scrolloff=8
set splitright
set splitbelow
set mouse=a
set autoread
filetype on
filetype plugin on
filetype indent on

"" Encoding

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Search

set incsearch
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
Plug 'preservim/nerdtree'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'jamshedvesuna/vim-markdown-preview'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'ObserverOfTime/coloresque.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rust-lang/rust.vim'

call plug#end()

"" NERDTree configuration
  
map <C-n> :NERDTreeToggle<CR>
  
"" Emmet configuration
  
let user_emmet_expandabbr_key = '<c-e>'

"" Markdow Preview configuration

map <leader>p :Mm<CR>

"" AirLine 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

