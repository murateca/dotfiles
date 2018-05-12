" SpaceVim Options: {{{
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_tabline_filetype_icon = 0
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_buffer_index_type = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:spacevim_windows_smartclose = ''
let g:spacevim_colorscheme = 'jellybeans'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_guifont = 'Droid Sans Mono for Powerline Plus Nerd File Types Mono 11'
let g:spacevim_enable_vimfiler_welcome = 0
" }}}

" SpaceVim Layers: {{{
call SpaceVim#layers#load('colorscheme')
" }}}

" Startify: {
let g:startify_bookmarks = [ {'c': '~/.SpaceVim.d/init.vim'} ]
" }

" General: {
autocmd FileType help wincmd L
let mapleader = ','
set diffopt+=vertical
" }
