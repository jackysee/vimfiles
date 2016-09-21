" --- Settings

set nocompatible
set tabstop=4 expandtab softtabstop=4 shiftwidth=4
set autoread
set nowrap
filetype on
filetype indent on
filetype plugin on
syntax on
set hlsearch
set number
set title
set showmatch
set showmode
set wildchar=<TAB>
set wildmenu
set wildignore=*.o,*.class,*.pyc,*.swp,*.bak,node_modules,elm_stuff
set autoindent
set incsearch
set nobackup
set noswapfile
set copyindent
set ignorecase
set smartcase
set cursorline
set clipboard=unnamed
set lines=50 columns=100

" auto reload vimrc when editing it
autocmd! bufwritepost vimrc source ~/_vimrc

if has("gui_running")	" GUI color and font settings8
  set guifont=Source_Code_Pro_Semibold:h9
  set background=dark
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colors codeschool
  colorscheme codeschool
  highlight CursorLine guibg=#003853 ctermbg=24  gui=none cterm=none
endif

"gui options
set guioptions-=T
set guioptions-=m

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
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

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


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","


" ,/ turn off search highlight
nmap <leader>/ :nohl<CR>

"; :
nnoremap ; :

"space to page down
nnoremap <SPACE> <PAGEDOWN>

" indent in visual model
vnoremap < <gv
vnoremap > >gv

" list buffer
nnoremap <leader>b :b <C-d>

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









"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
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

" --- whitespace
set list listchars=tab:»-,trail:·

" --- search

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" --- pathogen
execute pathogen#infect()


" --- vim-sneak
let g:sneak#s_next=1



