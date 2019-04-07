function! config#before() abort
  let g:mapleader = ","
  let g:startify_bookmarks = [ {'n': '~/.SpaceVim.d/init.toml'}, {'c': '~/.SpaceVim.d/autoload/config.vim'} ]
endfunction

function! config#after() abort
  autocmd FileType help wincmd L
  set diffopt+=vertical
endfunction
