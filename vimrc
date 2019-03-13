" notes for windows the ~/_vimrc 
" need to :
"   set rtp+=c:/[loc_of_vimfiles]
"   source c:/[loc_of_vimfiles]/vimrc

" Settings
" -----------------------------
set nocompatible
set nowrap
set textwidth=0
set hlsearch
set number
set relativenumber
set title
set showmatch
set showmode
set wildchar=<TAB>
set wildignore=*.o,*.class,*.pyc,*.swp,*.bak,node_modules,elm_stuff
set wildmenu
set wildmode=longest:list,full
set nobackup
set noswapfile
set copyindent
set ignorecase
set smartcase
set clipboard=unnamed
set splitbelow
set splitright
set fileformats=unix

set timeoutlen=1000
set ttimeoutlen=0
set lazyredraw

" Plugins
" -----------------------------
"

let s:path = expand('<sfile>:p:h')

call plug#begin(s:path . '/plugged')

"theme
Plug 'ajh17/spacegray.vim'

"snip
Plug 'SirVer/ultisnips'

Plug 'ajh17/VimCompletesMe'

Plug 'mattn/emmet-vim'

Plug 'mbbill/undotree'

Plug 'tpope/vim-commentary'

Plug 'terryma/vim-expand-region'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-sensible'

Plug 'justinmk/vim-sneak'

" Plug 'unblevable/quick-scope' 

Plug 'tpope/vim-surround'

Plug 'itchyny/lightline.vim'

Plug 'Asheq/close-buffers.vim'

" Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

" js / vue
" ------

Plug 'w0rp/ale'

Plug 'pangloss/vim-javascript'

Plug 'elzr/vim-json'

Plug 'prettier/vim-prettier', { 'branch': 'release/1.x', 'for': [ 'javascript', 'css', 'scss', 'markdown', 'vue', 'html', 'yaml'] }

Plug 'posva/vim-vue'

Plug 'haya14busa/is.vim'

Plug 'terryma/vim-multiple-cursors'
"Plug 'mileszs/ack.vim'
"
"Plug 'tpope/vim-fugitive'

"Plug 'nathanaelkane/vim-indent-guides'

Plug 'danro/rename.vim'


call plug#end()

" auto reload vimrc when editing it
autocmd! bufwritepost vimrc source ~/_vimrc

if !has("gui_running")	" running term
  colors molokai 
  colorscheme molokai 
endif

if has("gui_running")	" GUI
  au GUIEnter * simalt ~x
  set lines=50 columns=100
  set relativenumber
  "set guifont=Anonymous_Pro:h10.5
  set guifont=Fira_Code_Medium:h10
  set background=dark
  set linespace=1
  set t_Co=256          " 256 color mode
  "set cursorline        " highlight current line
  colors molokai
  colorscheme molokai
  highlight CursorLine guibg=#003844 ctermbg=24  gui=none cterm=none
endif

"gui options
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
    set expandtab        "replace <TAB> with spaces
"   set noexpandtab        "do not expand <TAB> with spaces
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
"   au FileType Makefile set noexpandtab
"}

" status line {
set noshowmode
" set laststatus=2
" set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
" set statusline+=\ \ \ [%{&ff}/%Y]
" set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
" set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" Shortcuts
" -----------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","


" <C-L> turn off search highlight in sensible.vim
nnoremap <leader>l :nohlsearch<CR>

"; :
nnoremap ; :
nnoremap > ;

"space to page down
nnoremap <SPACE> <PAGEDOWN>
nnoremap <S-SPACE> <PAGEUP>

" indent in visual model
vnoremap < <gv
vnoremap > >gv

" list buffer
"nnoremap <leader>b :b <C-d>
"nnoremap <leader>b :buffers<CR>:buffer<Space>
"nnoremap <leader>b :Buffers<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>

" trim trailing space
nnoremap <leader>s :call StripTrailingWhitespace()<cr>
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>'
    normal `z
  endif
endfunction

" undotree
nnoremap <F5> :UndotreeToggle<cr>

"jump between split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" emmet
imap ,e <C-y>,

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)


" autocomplete
" f: filenames, i:keywords, l:whole lines, n:keywords in current file,
" o:omnicompletion, ]:tags, u:user
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

set omnifunc=syntaxcomplete#Complete

"VimCompletesMe
let g:vcm_default_map = 0
imap <C-j> <plug>vim_completes_me_forward
imap <C-k> <plug>vim_completes_me_backward

" Enconding
" -----------------------------
set encoding=utf-8

set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
    set encoding=utf-8
    set termencoding=big5
endfun

fun! UTF8()
    set encoding=utf-8
    set termencoding=big5
    set fileencoding=utf-8
    set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
    set encoding=big5
    set fileencoding=big5
endfun

" whitespace
" -----------------------------
set list listchars=tab:»-,trail:·

"" ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg --files --color=never "" %s'
  "let g:ctrlp_user_command = 'fd --type f --color never "" %s'
  let g:ctrlp_use_caching = 1
endif
nnoremap <leader>f :CtrlP<cr>



" search (fzf)
" setting on windows :
"   scoop install fzf 
"   scoop install ripgrep 
"   set FZF_DEFAULT_COMMAND='rg --files'
" -----------------------------
" if has('win32') || has('win64')
"     set rtp+=/c/Users/jackys/scoop/shims/fzf
" else
"     set rtp+=/usr/local/opt/fzf
" endif

" command! -bang -nargs=* Rg
" \ call fzf#vim#grep(
" \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
" \   <bang>0 ? fzf#vim#with_preview('up:60%')
" \           : fzf#vim#with_preview('right:50%:hidden', '?'),
" \   <bang>0)

"let g:fzf_launcher = 'urxvt -geometry 120x30 -e sh -c %s'
" nnoremap <leader>f :FZF<cr>
" nnoremap <leader>r :Rg 


" vim-sneak
" -----------------------------
let g:sneak#s_next=1
let g:sneak#streak=1


" ale
" -----------------------------
"let g:ale_sign_column_always = 1
" let g:ale_sign_error = 'x'
" let g:ale_sign_warning = '!'
" let g:ale_sign_style_error = 'x'
" let g:ale_sign_style_warning = '!' 
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_text_changed = 'normal'


" Prettier
" -----------------------------
let g:prettier#exec_cmd_path = 'src/frontend/node_modules/.bin/prettier'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#config_precedence = 'file-override'

" vim-vue
" -----------------------------
let g:vue_disable_pre_processors=1


" ultisnips
" -----------------------------
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" quick-scope
" -----------------------------
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" ack
" let g:ackprg = 'rg --vimgrep --no-heading'
