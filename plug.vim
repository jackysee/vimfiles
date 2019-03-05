
let s:path = expand('<sfile>:p:h')

call plug#begin(s:path . '/plugged')

Plug 'ajh17/spacegray.vim'

Plug 'ajh17/VimCompletesMe'

Plug 'mattn/emmet-vim'

Plug 'mbbill/undotree'

Plug 'tpope/vim-commentary'

Plug 'terryma/vim-expand-region'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-sneak'

Plug 'tpope/vim-surround'

" js
" ------

Plug 'w0rp/ale'

Plug 'pangloss/vim-javascript'

Plug 'elzr/vim-json'

Plug 'prettier/vim-prettier', { 'branch': 'release/1.x', 'for': [ 'javascript', 'css', 'scss', 'markdown', 'vue', 'html', 'yaml'] }


call plug#end()
