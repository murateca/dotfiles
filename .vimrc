"Runtime
set runtimepath+=~/.vim

"Auto commands
autocmd!
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType help wincmd L

"Commands
command! AdjustEndOfLine execute '%s/\r\(\n\)/\1/g'
command! ClearRegisters call ClearRegisters()

"Functions
function! ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
  let i=0
  while (i<strlen(regs))
      exec 'let @'.regs[i].'=""'
      let i=i+1
  endwhile
endfunction

"----------------------------------------------------------
"------------------------ vim-plug ------------------------
"----------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' }

Plug 'tomasr/molokai'

Plug 'mattn/emmet-vim'

Plug 'mhinz/vim-startify'

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
\	'component_function': {
\		'filename': 'LightlineFilename',
\		'fileformat': 'LightlineFileformat',
\		'filetype': 'LightlineFiletype',
\		'fileencoding': 'LightlineFileencoding',
\		'mode': 'LightlineMode',
\		'readonly': 'LightlineReadonly',
\		'modified': 'LightlineModified',
\	},
\	'tab': {
\		'active': [ 'tabnum', 'filename', 'modified', 'readonly' ],
\		'inactive': [ 'tabnum', 'filename', 'modified', 'readonly' ] 
\	},
\	'tab_component_function': { 
\		'filename': 'TablineFilename',
\		'modified': 'TablineModified',
\		'readonly': 'TablineReadonly',	
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

function! TablineModified(n)
  let winnr = tabpagewinnr(a:n)
  return gettabwinvar(a:n, winnr, '&modified') ? "\u26ab" : gettabwinvar(a:n, winnr, '&modifiable') ? '' : "\u26ca"
endfunction

function! TablineReadonly(n)
 let winnr = tabpagewinnr(a:n)
 return gettabwinvar(a:n, winnr, '&readonly') ? "\u26c9" : ''
endfunction

function! TablineFilename(n)
 let buflist = tabpagebuflist(a:n)
 let winnr = tabpagewinnr(a:n)
 let tname = expand('#'.buflist[winnr - 1].':t')
 return tname =~ 'NERD_tree' ? 'NERDTree' : tname !=# '' ? tname : '[No Name]'
endfunction

"-Jellybeans
silent! colorscheme jellybeans

"-Emmet
let g:user_emmet_expandabbr_key = '<M-y>'

"-Startify
let g:startify_bookmarks = [ {'c': '~/.vimrc'} ]

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
set incsearch
set ignorecase
set smartcase

"Directories for swp files
set nobackup
set noswapfile

"Fileformat
set fileformats=unix,dos,mac
set showcmd

"Run as Python3 code#Linux
"nnoremap <silent> <F5> :w<CR>:!clear;python3 %<CR>

"Run as Python code#Windows
"nnoremap <silent> <F5> :w<CR>:!cls&python %<CR>

"gvim settings
if has('gui_running')
	au GUIEnter * simalt ~x
	highlight Normal guibg=black guifg=white
	highlight LineNr guifg=grey
	set background=dark
	set guifont=Consolas:h10
endif

"Cursor settings#Gnome Terminal
"au InsertEnter * silent execute "!echo -en \<esc>[5 q"
"au InsertLeave * silent execute "!echo -en \<esc>[2 q"


"Mappings
cno $h e ~/
