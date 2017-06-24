set mouse=
""""""""
" dein "
""""""""
set nocompatible
set runtimepath^=~/.dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.dein'))
call dein#add('Shougo/dein.vim')                " plugin manager
call dein#add('Shougo/neocomplete.vim')         " completion menus
call dein#add('scrooloose/syntastic')           " highlight incorrect syntax in red

call dein#add('wincent/command-t')
call dein#add('bronson/vim-crosshairs')         " only show cursorcolumn/line on active buffer
"call dein#add('bling/vim-airline')             " fancy modeline
"call dein#add('edkolev/tmuxline.vim')
call dein#add('mhinz/vim-signify')

"call dein#add('marciomazza/vim-brogrammer-theme')
call dein#end()

if dein#check_install()
    call dein#install()
endif

""""""""""""
" settings "
""""""""""""
set showcmd
set splitbelow
set splitright

set cursorcolumn
set cursorline

"""""""""""""""""""
" default spacing "
"""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4

""""""""""
" colors "
""""""""""
syntax on
colorscheme slate

""""""""""
" python "
""""""""""
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=80

  let python_highlight_all = 1
  autocmd FileType python syn keyword pythonDecorator True None False self
augroup END

"""""""""""
" plugins "
"""""""""""
let g:neocomplete#enable_at_startup = 1  " use neocomplete
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
