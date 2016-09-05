""""""""
" dein "
""""""""
set nocompatible
set runtimepath^=~/.dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.dein'))
call dein#add('Shougo/dein.vim')				" plugin manager
call dein#add('Shougo/neocomplete.vim')			" completion menus
call dein#add('scrooloose/syntastic')			" highlight incorrect syntax in red
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

call dein#add('bronson/vim-crosshairs')			" only show cursorcolumn/line on active buffer
call dein#add('bling/vim-airline')				" fancy modeline
call dein#add('edkolev/tmuxline.vim')
call dein#add('mhinz/vim-signify')

call dein#add('marciomazza/vim-brogrammer-theme')

call dein#add('fatih/vim-go')
call dein#add('rodjek/vim-puppet')
call dein#end()

if dein#check_install()
    call dein#install()
endif

""""""""""""
" settings "
""""""""""""
filetype off
filetype plugin indent on

set autoindent
set backspace=indent,eol,start	" allow backspacing through beginning of lines
set colorcolumn=80
set cursorcolumn 				" highlight column the cursor is on
set cursorline					" highlight line the cursor is on
set hlsearch					" highlight search results
set ignorecase 					" case insensitive searching
set incsearch 					" highlight search results while typing
set laststatus=2 				" always show the status line
set lazyredraw
set number						" show linenumbers
set shiftwidth=4				" autoindent tabs = 4 spaces
set showcmd						" show what I'm typing
set smartcase					" pay attention to case if search starts with uppercase
set splitbelow					" split downward
set splitright					" split to the right
set tabstop=4					" tabs = 4 spaces

if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

""""""""""""
" keybinds "
""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""
" colors "
""""""""""
syntax on
set t_Co=256
colorscheme brogrammer

""""""""""""""""""""""""""""""
" language-specific commands "
""""""""""""""""""""""""""""""
" go
au BufRead,BufNewFile *.go set tabstop=2 shiftwidth=2
" ruby/puppet
au BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.pp set tabstop=2 shiftwidth=2
" js/json
au BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.json set tabstop=2 shiftwidth=2
" yaml (also salt, ansible)
au BufRead,BufNewFile *.sls set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.yaml set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.yml set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.raml set tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.play set tabstop=2 shiftwidth=2
" html
au BufRead,BufNewFile *.html set tabstop=2 shiftwidth=2
" Makefiles
au BufRead,BufNewFile Makefile set noexpandtab

""""""""""""""""
" plugin setup "
""""""""""""""""
" neocomplete
let g:neocomplete#enable_at_startup = 1
" airline
let g:airline_powerline_fonts=1
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" signify
let g:signify_vcs_list = [ 'git', 'hg' ]
