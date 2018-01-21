"Runtime
set runtimepath+=~/.vim

"Auto commands
autocmd!
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType help wincmd L

"----------------------------------------------------------
"------------------------ vim-plug ------------------------
"----------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-surround'

Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' }

Plug 'tomasr/molokai'

call plug#end()

"---Plugin Settings---
"---------------------

"-Nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

"-Lighline
set laststatus=2
set noshowmode
let g:lightline = {
\	'active': {
\		'left': [ 
\			[ 'mode', 'paste' ],
\           [  'filename'],
\			],
\		'right': [ 
\			[ 'lineinfo' ],
\           [ 'percent' ],
\           [ 'filetype', 'fileencoding', 'fileformat'] 
\			]
\	},
\	'tab': {
\		'active': [ 'tabnum', 'filename', 'modified' ],
\		'inactive': [ 'tabnum', 'filename', 'modified' ] 
\	},
\	'component_function': {
\		'filename': 'LightlineFilename',
\		'fileformat': 'LightlineFileformat',
\		'filetype': 'LightlineFiletype',
\		'fileencoding': 'LightlineFileencoding',
\		'mode': 'LightlineMode',
\		'readonly': 'LightlineReadonly',
\		'modified': 'LightlineModified',
\	},
\	'separator': { 'left': '', 'right': '' },
\	'subseparator': { 'left': '|', 'right': '|'}, 
\	'colorscheme': 'jellybeans'
\}

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? "\u2630" : ''
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? "\u26bf" : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:F')
  return  fname =~ 'NERD_tree' ? '' :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'N/A') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"-Jellybeans
colorscheme jellybeans

"----------------------------------------------------------
"----------------------------------------------------------

"Syntax
syntax on

"Line Numbers
set number
set rnu
highlight LineNr ctermfg=grey 

"Esc delay off
set timeoutlen=1000 ttimeoutlen=0

"Tab Settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Backspace indent fix
set backspace=indent,eol,start

"Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"Filetype indent
filetype plugin indent on

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Directories for swp files
set nobackup
set noswapfile

"Fileformat
set fileformats=unix,dos,mac
set showcmd

"Run as Python3 code on Linux
nnoremap <silent> <F5> :w<CR>:!clear;python3 %<CR>

"Run as Python code on Windows
"nnoremap <silent> <F5> :w<CR>:!cls&python %<CR>

"gvim settings
if has('gui_running')
	au GUIEnter * simalt ~x
	highlight Normal guibg=black guifg=white
	highlight LineNr guifg=grey
	set background=dark
	set guifont=Consolas
endif

"Cursor settings
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

"Mappings
cno $h e ~/
