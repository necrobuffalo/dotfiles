set mouse=
""""""""""""""""""
" VUNDLE/PLUGINS "
""""""""""""""""""
set nocompatible
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete.vim'          " completion menus
Plugin 'scrooloose/syntastic'            " highlight incorrect syntax in red
Plugin 'wincent/command-t'               " fuzzy finder
Plugin 'bronson/vim-crosshairs'          " only show cursorcolumn/line on active buffer
Plugin 'bling/vim-airline'               " fancy modeline
Plugin 'mhinz/vim-signify'               " display VCS info
Plugin 'Yggdroot/indentLine'             " indent info

""""""""""""""""""""
" LANGUAGE PLUGINS "
""""""""""""""""""""
Plugin 'pearofducks/ansible-vim'         " fixes inconsistent highlighting in ansible yaml files
Plugin 'elixir-lang/vim-elixir'          " elixir syntax highlighting
Plugin 'ElmCast/elm-vim'                 " elm syntax highlighting
Plugin 'fatih/vim-go'                    " go syntax highlighting
Plugin 'hashivim/vim-terraform'          " terraform syntax highlighting

Plugin 'godlygeek/tabular'               " required for vim-markdown
Plugin 'plasticboy/vim-markdown'         " markdown syntax highlighting

Plugin 'tpope/vim-speeddating'           " recommended for vim-orgmode
Plugin 'jceb/vim-orgmode'                " do org-mode things in vim

""""""""""""""""
" COLORSCHEMES "
""""""""""""""""
Plugin 'ayu-theme/ayu-vim'               " current color scheme
Plugin 'flazz/vim-colorschemes'          " library of other color schemes I should try sometime
Plugin 'vim-airline/vim-airline-themes'  " library of tab/modeline themes
call vundle#end()
filetype plugin indent on

""""""""""""
" SETTINGS "
""""""""""""
set laststatus=2                 " always display the modeline
set showcmd                      " show command while typing
set splitbelow                   " new splits go below
set splitright                   " new splits go to the right
set backspace=indent,eol,start   " allow backspacing through beginning of lines
set number                       " show line numbers
set wildmenu                     " show menu when tab completing
set wildmode=longest:full        " when tab completing, only complete through common text

set cursorcolumn                 " highlight column the cursor is on
set cursorline                   " highlight line the cursor is on

""""""""""""""
" WHITESPACE "
""""""""""""""
set expandtab                    " pressing tab should insert spaces
set tabstop=4                    " display existing tab characters as 4 spaces
set shiftwidth=4                 " indent by 4 using reindent commands (>> and <<)
set softtabstop=4                " ignored since we have expandtab set

""""""""""
" COLORS "
""""""""""
syntax on
set termguicolors                " read guibg, guifg etc. even in terminal
let ayucolor="dark"              " set ayu flavor (dark, mirage, light)
colorscheme ayu                  " choose colorscheme

"""""""
" GUI "
"""""""
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Fira\ Code\ 12
  elseif has("gui_macvim")
    set guifont=Fira\ Code:h12
  " elseif has("gui_win32")
  "   set guifont=Fira Code:h11:cANSI
  endif
endif

""""""""""""
" KEYBINDS "
""""""""""""
let mapleader=","
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""
" LANG-SPECIFIC SETTINGS "
""""""""""""""""""""""""""
" haskell
augroup filetype_haskell
  autocmd!
  autocmd FileType haskell setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
augroup END

" makefiles
augroup filetype_make
  autocmd!
  autocmd FileType make setlocal
    \ noexpandtab
augroup END

" php
augroup filetype_php
  autocmd!
  autocmd FileType php setlocal
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
    \ foldmethod=indent

  let python_highlight_all = 1
  autocmd FileType python syn keyword pythonDecorator True None False self
augroup END

" terraform
augroup filetype_terraform
  autocmd!
  autocmd FileType terraform setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
augroup END

" vim
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
augroup END

" yaml, ansible, salt, etc.
augroup filetype_yaml
  autocmd!
  autocmd FileType yaml setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
augroup END

"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
" airline
let g:airline_powerline_fonts=1  " display powerline characters instead of boxes
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='lucius'

" command-t
let g:CommandTMaxCachedDirectories=10

" indentline
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = ['command-t', 'help'] " exclude some things from showing indent lines

" markdown
let g:vim_markdown_frontmatter = 1 " highlight hugo frontmatter

" neocomplete
let g:neocomplete#enable_at_startup = 1  " use neocomplete

" orgmode
let g:org_indent = 1

" signify
let g:signify_vcs_list = ['git', 'hg']

" syntastic
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
