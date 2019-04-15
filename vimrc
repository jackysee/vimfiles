" notes for windows the ~/_vimrc
" need to :
"   set rtp+=c:/[loc_of_vimfiles]
"   source c:/[loc_of_vimfiles]el/vimrc


" Constants
" -----------------------------
let s:is_windows = has('win32') || has('win64')
let s:is_gui = has("gui_running")
let s:is_fast = !s:is_windows || (s:is_windows && s:is_gui)


" shell
" -----------------------------
if s:is_windows
    set shellcmdflag=/D/C
endif
if executable('zsh')
    set shell=/usr/local/bin/zsh
endif


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
set hidden
" set timeoutlen=1000
" set ttimeoutlen=0
set lazyredraw
set regexpengine=1


" Plugins
" -----------------------------
"
"
let s:path = expand('<sfile>:p:h')
call plug#begin(s:path . '/plugged')

"theme
Plug 'ajh17/spacegray.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'kaicataldo/material.vim'

"start page
if s:is_fast
    Plug 'mhinz/vim-startify'
endif

"snip
if s:is_fast
    Plug 'SirVer/ultisnips'
endif

" Plug 'honza/vim-snippets'

" autocomplete
" ==========================================
" Plug 'ajh17/VimCompletesMe'
"
" == LanguageClient_neovim ==
" if s:is_windows
"     Plug 'autozimu/LanguageClient-neovim', {
"         \ 'branch': 'next',
"         \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
"         \ }
" else
"     Plug 'autozimu/LanguageClient-neovim', {
"         \ 'branch': 'next',
"         \ 'do': 'bash install.sh',
"         \ }
" endif


" == deoplete ==
if s:is_fast
    Plug 'Shougo/neco-syntax'
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'carlitux/deoplete-ternjs'
endif


" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'lighttiger2505/deoplete-vim-lsp'

" == ncm ==
" Plug 'Shougo/neco-syntax'
" Plug 'ncm2/ncm2'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-syntax'
" Plug 'fgrsnau/ncm-otherbuf'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/ncm2-html-subscope'

" == coc ==
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

Plug 'mbbill/undotree'
" Plug 'tpope/vim-commentary'
" Plug 'tyru/caw.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/context_filetype.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'danro/rename.vim'
Plug 'haya14busa/is.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'gregsexton/MatchTag'
Plug 'itchyny/vim-gitbranch'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript', { 'for': ['javascript', 'vue']}
Plug 'qpkorr/vim-bufkill'
Plug 'maximbaz/lightline-ale'
if s:is_fast
    Plug 'TaDaa/vimade'
endif

" file finder
" Plug 'junegunn/fzf.vim'
" Plug 'kien/ctrlp.vim'
" Plug 'Shougo/denite.nvim'
" Plug 'Shougo/neomru.vim'

if s:is_windows
 Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
else
 Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif

" js / vue
" ------
if s:is_fast
    Plug 'w0rp/ale', { 'for': ['javascript', 'vue', 'javascript.jsx']}
    Plug 'mattn/emmet-vim',  { 'for':['javascript', 'javascript.jsx', 'vue', 'html', 'css', 'scss', 'sass' ]}
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
    Plug 'elzr/vim-json', { 'for': ['json']}
    Plug 'prettier/vim-prettier', { 'branch': 'release/1.x', 'for': [ 'javascript', 'css', 'scss', 'markdown', 'vue', 'html', 'yaml'] }
    Plug 'posva/vim-vue', { 'for': ['vue']}
    Plug 'sgur/vim-editorconfig'
    " Plug 'gorodinskiy/vim-coloresque'
    " Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'vue', 'html'] }
    Plug 'RRethy/vim-hexokinase', { 'for': ['css', 'scss', 'sass', 'vue', 'html'] }
    Plug 'Raimondi/delimitMate'
    Plug '1995eaton/vim-better-javascript-completion',  { 'for': [ 'javascript', 'vue' ]}
endif
call plug#end()


" auto reload vimrc when editing it
if s:is_windows
  autocmd! bufwritepost vimrc source ~/_vimrc
else
  autocmd! bufwritepost vimrc source ~/.vimrc
endif

set termguicolors
set background=dark

" colorscheme molokai
" colorscheme gotham

let g:material_theme_style = 'dark'
colorscheme material

" let g:seoul256_background = 233
" colorscheme seoul256

" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox

" colorscheme nord
" colorscheme solarized8_high

" if !has("gui_running")	" running term
" endif

if has("gui_running")	" GUI
  au GUIEnter * simalt ~x
  set relativenumber
  " set guifont=Anonymous_Pro:h11
  " set guifont=Fira_Code_Medium:h10
  set guifont=Source_Code_Pro:h10
  set linespace=1
  " set t_Co=256          " 256 color mode
  set cursorline
  "highlight CursorLine guibg=#003844 ctermbg=24  gui=none cterm=none
endif

let g:vimade = {}
let g:vimade.fadelevel = 0.5

"gui options
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

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

function! s:list_commits()
    let git = 'git -C ~/repo'
    let commits = systemlist(git .' log --oneline | head -n10')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

"startify
let g:startify_custom_header = ['']
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
            \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
            \ { 'header': ['   MRU'],            'type': 'files' },
            \ { 'header': ['   Sessions'],       'type': 'sessions' }
            \ ]


" Shortcuts
" -----------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","


" search selected text in visual mode
vnoremap // y/<C-R>"<CR>

" paste on visual mode without chaning original register
vnoremap p "_dP

" <C-L> turn off search highlight in sensible.vim
nnoremap <leader>l :nohlsearch<CR>

" keyword for search exclude period
map <leader>k :set iskeyword=65-90,95,97-122,48-57<CR>

"; :
nnoremap ; :
nnoremap > ;
nnoremap < ,

"space to page down
" nnoremap <SPACE> <PAGEDOWN>
" nnoremap <S-SPACE> <PAGEUP>

" indent in visual model
vnoremap < <gv
vnoremap > >gv

" list buffer
"nnoremap <leader>b :b <C-d>
"nnoremap <leader>b :buffers<CR>:buffer<Space>
"nnoremap <leader>b :Buffers<CR>
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" trim trailing space
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" undotree
nnoremap <F5> :UndotreeToggle<cr>

"jump between split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" emmet
imap <leader>, <C-y>,

" vimdiff
if &diff
    nnoremap <leader>1 :diffget LOCAL<cr>
    nnoremap <leader>2 :diffget BASE<cr>
    nnoremap <leader>3 :diffget REMOTE<cr>
endif

" vim-expand-region
" map K <Plug>(expand_region_expand)
" map J <Plug>(expand_region_shrink)
call expand_region#custom_text_objects({
            \ 'i]':1,
            \ 'a]':1,
            \ 'at':1,
            \ 'ab':1,
            \ 'aB':1
            \ })


" autocomplete
" f: filenames, i:keywords, l:whole lines, n:keywords in current file,
" o:omnicompletion, ]:tags, u:user
" inoremap <silent> ,f <C-x><C-f>
" inoremap <silent> ,i <C-x><C-i>
" inoremap <silent> ,l <C-x><C-l>
" inoremap <silent> ,n <C-x><C-n>
" inoremap <silent> ,o <C-x><C-o>
" inoremap <silent> ,t <C-x><C-]>
" inoremap <silent> ,u <C-x><C-u>

" set omnifunc=syntaxcomplete#Complete

"VimCompletesMe
" let g:vcm_default_map = 0
" imap <C-j> <plug>vim_completes_me_forward
" imap <C-k> <plug>vim_completes_me_backward

" languageClient
" -----------------------------
" let g:LanguageClient_loggingFile = expand('/tmp/LanguageClient.log')
" let g:LanguageClient_settingsPath = $HOMEPATH.'/vimfiles/lc_settings.json'
" set hidden
" let g:LanguageClient_serverCommands = {}
" " npm install -g vscode-css-languageserver-bin
" if executable('css-languageserver')
"   let g:LanguageClient_serverCommands = extend(g:LanguageClient_serverCommands, {
"   \ 'css': [&shell, &shellcmdflag, 'css-languageserver', '--stdio' ],
"   \ 'scss': [&shell, &shellcmdflag, 'css-languageserver', '--stdio' ]
"   \ })
" endif
" " npm install -g javascript-typescript-stdio
" if executable('javascript-typescript-stdio')
"   let g:LanguageClient_serverCommands = extend(g:LanguageClient_serverCommands, {
"     \ 'javascript': [&shell, &shellcmdflag, 'javascript-typescript-stdio'],
"     \ 'javascript.jsx': [&shell, &shellcmdflag, 'javascript-typescript-stdio'],
"     \ })
" endif
" if executable('vls')
"   let g:LanguageClient_serverCommands = extend(g:LanguageClient_serverCommands, {
"     \ 'vue': [&shell, &shellcmdflag, 'vls']
"     \ })
" endif
"
"
" vim-lsp
" -----------------------------
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
"
" if executable('css-languageserver')
" au User lsp_setup call lsp#register_server({
"   \ 'name': 'css-languageserver',
"   \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver', '--stdio']},
"   \ 'whitelist': ['css', 'sass', 'scss', 'less'],
"   \ })
" endif
" if executable('javascript-typescript-stdio')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'javasscript typescript lanugage-server',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
"     \ 'whitelist': ['javascript', 'javascript.jsx'],
"     \ })
" endif
" if executable('vls')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'vue language server',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vls --stdio']},
"     \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
"     \ 'whitelist': ['vue'],
"     \ })
" endif

" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
" call deoplete#custom#source('lsp', 'is_debug_enabled', 1)


" deoplete
" -----------------------------
if exists('g:deoplete#enable_at_startup')
    set completeopt=longest,menuone,preview
    let g:deoplete#enable_at_startup = 0
    autocmd InsertEnter * call deoplete#enable()
    inoremap <expr><C-g>     deoplete#undo_completion()
    call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
    call deoplete#custom#source('ultisnips', 'rank', 1000)
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0
    call deoplete#custom#var('around', {
                \   'range_above': 15,
                \   'range_below': 15,
                \   'mark_above': '[↑]',
                \   'mark_below': '[↓]',
                \   'mark_changes': '[*]',
                \})
endif

" ncm2
" -----------------------------
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" set shortmess+=c
" set hidden


" coc
" -----------------------------
" let g:coc_global_extensions = [
"             \   'coc-css',
"             \   'coc-html',
"             \   'coc-json',
"             \   'coc-tsserver',
"             \   'coc-vetur'
"             \ ]
" set hidden
" set shortmess+=c

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

" open file
" -----------------------------
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :evsp %%
map <leader>et :tabe %%

" whitespace
" -----------------------------
set list listchars=tab:»-,trail:·

"" ctrlp
" -----------------------------
" if executable('rg')
"   set grepprg=rg\ --color=never
"   let g:ctrlp_fallback_command = 'rg --files --color=never %s'
" else
"   if s:is_windows
"     let g:ctrlp_fallback_command = 'dir %s /-n /b /s /a-d'  " Windows
"   else
"     let g:ctrlp_fallback_command = 'find %s -type f'        " MacOSX/Linux
"   endif
" endif
"
" let g:ctrlp_user_command = {
" 	\ 'types': {
" 		\ 1: ['.git', 'cd %s && git ls-tree -r --name-only HEAD'],
" 		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
" 		\ },
" 	\ 'fallback': g:ctrlp_fallback_command
" 	\ }
"
" if s:is_windows
"     nnoremap <C-P> :CtrlP<cr>
" else
"     "fzf is much faster in *nix
"     set rtp+=~/.fzf
"     nnoremap <C-P> :FZF<cr>
" endif


" denite
" -----------------------------
" call denite#custom#option('_', 'highlight_matched_char', 'Underline')
" call denite#custom#option('_', 'highlight_preview_line', 'Underline')
" call denite#custom#option('_', 'highlight_mode_insert', 'WildMenu')
" call denite#custom#option('_', 'winheight', 15)
" call denite#custom#source( 'file/rec', 'sorters', ['sorter/sublime'])
" call denite#custom#source( 'file/rec/hg', 'sorters', ['sorter/sublime'])
" call denite#custom#source( 'file/rec/git', 'sorters', ['sorter/sublime'])
" call denite#custom#var('file/rec', 'command',
" \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"
" call denite#custom#var('file/rec', 'command',
"     \ ['rg', '--files', '--glob', '!.git'])
"
" call denite#custom#alias('source', 'file/rec/git', 'file/rec')
" call denite#custom#var('file/rec/git', 'command',
"     \ ['git', 'ls-tree', '-r' ,'--name-only', 'HEAD'])
"
" call denite#custom#alias('source', 'file/rec/hg', 'file/rec')
" call denite#custom#var('file/rec/hg', 'command', ['hg', 'files'])
"
" function! DeniteFileRec()
"     if finddir('.git', ';') != ''
"         return 'file/rec/git'
"     elseif finddir('.hg', ';') != ''
"         return 'file/rec/hg'
"     else
"         return 'file/rec'
" endfunction
"
" nnoremap <silent> <leader>f :<C-u>Denite `DeniteFileRec()` buffer file_mru<CR>
"
" call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

" leaderF
" --------------
nnoremap <leader>r :LeaderfMru<CR>
nnoremap <leader>g :Leaderf rg -e<Space>
let g:Lf_WindowHeight = 0.30
let g:Lf_MruFileExclude = ['*.so', '*.tmp', '*.bak', '*.exe', '*.dll']
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }


" search (fzf)
" setting on windows :
"   scoop install fzf
"   scoop install ripgrep
"   set FZF_DEFAULT_COMMAND='rg --files'
" -----------------------------
" if s:is_windows
"     set rtp+=/c/Users/jackys/scoop/shims/fzf
" else
"     set rtp+=/usr/local/opt/fzf
" endif

" vim-sneak
" -----------------------------
let g:sneak#s_next=1
let g:sneak#streak=1
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T


" ale
" -----------------------------
"let g:ale_sign_column_always = 1
" let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚠'
" let g:ale_sign_error = 'x'
" let g:ale_sign_warning = '!'
" let g:ale_sign_style_error = 'x'
" let g:ale_sign_style_warning = '!'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_text_changed = 'normal'


" Prettier
" -----------------------------
let s:prettierexec1 = getcwd() . '/src/frontend/node_modules/.bin/prettier'
let s:prettierexec2 = getcwd() . '/web/node_modules/.bin/prettier'
if filereadable(s:prettierexec1)
    let g:prettier#exec_cmd_path = s:prettierexec1
elseif filereadable(s:prettierexec2)
    let g:prettier#exec_cmd_path = s:prettierexec2
endif
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#config#config_precedence = 'file-override'

" vim-vue
" -----------------------------
" au BufNewFile,BufRead *.vue setlocal filetype=vue.html.javascript.css
" let g:vim_vue_plugin_load_full_syntax = 1
" let g:vim_vue_plugin_debug = 1
" autocmd FileType vue syntax sync fromstart
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" vim-json
" -----------------------------
let g:vim_json_syntax_conceal = 0


" ultisnips
" -----------------------------
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " quick-scope
" " -----------------------------
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" let g:qs_lazy_highlight = 1
" augroup qs_colors
"   autocmd!
"   autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
"   autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" augroup END

" ack
" let g:ackprg = 'rg --vimgrep --no-heading'


"lightline
let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'coc', 'branch', 'filename' ] ],
            \   'right': [
            \       [ 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
            \   ]
            \ },
            \ 'component_expand': {
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \ },
            \ 'component_function': {
            \   'branch': 'LightlineGitBranch',
            \   'filename': 'LightlineFilename'
            \ }
            \ }


function! LightlineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction
function! LightlineGitBranch()
    if exists('*gitbranch#name')
        return gitbranch#name()
    endif
    return ''
endfunction

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
