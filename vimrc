set mouse=
""""""""""""""""""""""
" vundle and friends "
""""""""""""""""""""""
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'  " completion menus
Plugin 'scrooloose/syntastic'    " highlight incorrect syntax in red

Plugin 'wincent/command-t'       " fuzzy finder
Plugin 'bronson/vim-crosshairs'  " only show cursorcolumn/line on active buffer
Plugin 'bling/vim-airline'       " fancy modeline
Plugin 'mhinz/vim-signify'       " display VCS info

Plugin 'godlygeek/tabular'       " required for vim-markdown
Plugin 'plasticboy/vim-markdown' " markdown syntax highlighting

Plugin 'flazz/vim-colorschemes'
call vundle#end()
filetype plugin indent on

""""""""""""
" settings "
""""""""""""
set laststatus=2                 " always display the modeline
set showcmd                      " show command while typing
set splitbelow                   " new splits go below
set splitright                   " new splits go to the right
set backspace=indent,eol,start

set cursorcolumn                 " highlight column the cursor is on
set cursorline                   " highlight line the cursor is on

"""""""""""""""""""
" default spacing "
"""""""""""""""""""
set expandtab                    " convert tabs to spaces
set shiftwidth=4
set tabstop=4

""""""""""
" colors "
""""""""""
syntax on
colorscheme slate
colorscheme gruvbox

""""""""""""
" keybinds "
""""""""""""
let mapleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""
" lang-specific settings "
""""""""""""""""""""""""""
" ansible, salt, etc.
augroup filetype_yaml
  autocmd!
  autocmd FileType yaml setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
augroup END

" python
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

" makefiles
augroup filetype_make
  autocmd!
  autocmd FileType make setlocal
    \ noexpandtab
augroup END

"""""""""""
" plugins "
"""""""""""
let g:neocomplete#enable_at_startup = 1  " use neocomplete
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
let g:airline_powerline_fonts=1  " display powerline characters instead of boxes
let g:signify_vcs_list = ['git', 'hg']
let g:vim_markdown_frontmatter = 1 " highlight hugo frontmatter
