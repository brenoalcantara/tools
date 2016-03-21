"" Visual Settings
syntax enable
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

set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab

"" Plugins

execute pathogen#infect()

"" NERDTree configuration

map <C-n> :NERDTreeToggle<CR>

"" Emmet configuration

let user_emmet_expandabbr_key = '<c-e>'

"" NERDTree Git configurarion

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

