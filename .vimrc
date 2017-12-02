"----------------------------------------------------------
"----------------------Pathogen----------------------------
"----------------------------------------------------------
execute pathogen#infect()

"---Plugin Settings---
"---------------------
"
"-Nerdtree
map <C-n> :NERDTreeToggle<CR>
"
"-Lighline
set laststatus=2
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'component': {
			\   'readonly': '%{&readonly?"x":""}',
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '|', 'right': '|' }
			\ }
"----------------------------------------------------------
"----------------------------------------------------------

"Syntax
syntax on

"Line Numbers
set number
set rnu
highlight LineNr ctermfg=grey 

"esc delay off
set timeoutlen=1000 ttimeoutlen=0

"Ruler
set ruler

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

"Run as Python code on Windows
nnoremap <silent> <F5> :w<CR>:!cls&python %<CR>

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
