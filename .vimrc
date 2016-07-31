" dein
set nocompatible
set runtimepath^=~/.dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('bronson/vim-crosshairs')
call dein#end()

if dein#check_install()
    call dein#install()
endif

" plugin setup
" neocomplete
let g:neocomplete#enable_at_startup = 1

" crosshairs
set cursorline
set cursorcolumn

" basic appearance
colorscheme pablo
set number
syntax on

" searching
set hlsearch
"set ignorecase
"set smartcase

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" whitespace
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4

" language-specific spacing
" go
autocmd BufRead,BufNewFile *.go set tabstop=2 shiftwidth=2
" ruby/puppet
autocmd BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.pp set tabstop=2 shiftwidth=2
" js/json
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.json set tabstop=2 shiftwidth=2
" yaml (also salt, ansible)
autocmd BufRead,BufNewFile *.sls set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.yaml set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.yml set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.raml set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.play set tabstop=2 shiftwidth=2
" html
autocmd BufRead,BufNewFile *.html set tabstop=2 shiftwidth=2
" Makefiles
autocmd BufRead,BufNewFile Makefile set noexpandtab
