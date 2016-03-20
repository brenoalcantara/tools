let user_emmet_expandabbr_key = '<c-e>'

set encoding=utf8
set nu
set ignorecase
set hls
set tabstop=4
set shiftwidth=4
set softtabstop=4

execute pathogen#infect()

syntax enable
colorscheme monokai

map <C-n> :NERDTreeToggle<CR>

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

