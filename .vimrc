" Neobundle
set nocompatible
let &runtimepath.=',' . $HOME . '/.vim/bundle/neobundle.vim/'
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'

call neobundle#end()
filetype plugin indent on               " use filetype plugins and indentation

NeoBundleCheck

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" General
set nocompatible                        " fuck vi
set encoding=utf-8                      " does what it says on the tin
set showcmd                             " show incomplete commands
set number                              " show line numbers

" Highlighting
colorscheme delek
syntax on                               " do syntax highlighting

" Whitespace
set nowrap
set backspace=indent,eol,start
set expandtab                           " use spaces instead of tabs
set tabstop=4                           " see tab characters as 4 spaces
set shiftwidth=4                        " pressing tab inserts 4 spaces

" Searching
set hlsearch                            " highlight matches when searching
set ignorecase                          " ignore case in searches
set smartcase                           " unless the search contains a capital

" Heathen languages that use 2 spaces
" Puppet
autocmd BufRead,BufNewFile *.pp set expandtab tabstop=2 shiftwidth=2
" js/json
autocmd BufRead,BufNewFile *.js set expandtab tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.json set expandtab tabstop=2 shiftwidth=2
" yaml (also salt, ansible)
autocmd BufRead,BufNewFile *.sls set expandtab tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.yaml set expandtab tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.yml set expandtab tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.play set expandtab tabstop=2 shiftwidth=2
