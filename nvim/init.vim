set mouse=
"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Automatic syntax checker.
Plug 'neomake/neomake'
" Fuzzy finder, doesn't require the setup of command-t.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" only show cursorcolumn/line on active buffer
Plug 'bronson/vim-crosshairs'            
" Fancier modeline.
" Plug 'bling/vim-airline'
" Display VCS info in the sidebar (additions, deletions, changes.)
Plug 'mhinz/vim-signify'
" Some more git stuff.
Plug 'tpope/vim-fugitive'
" Highlight indentation.
Plug 'Yggdroot/indentLine'
" Comment stuff out
Plug 'tpope/vim-commentary'
" Sessions
Plug 'tpope/vim-obsession'

""""""""""""""
" COMPLETION "
""""""""""""""
" Provides basic completion menus based on things previously typed.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Adds python support via jedi to deoplete.
Plug 'zchee/deoplete-jedi'
" Adds rust support to deoplete via racer.
Plug 'racer-rust/vim-racer'
" Adds generalized completion to deoplete using vim's built in syntax
" highlighting.
Plug 'Shougo/neco-syntax'

""""""""""""""""""""
" LANGUAGE PLUGINS "
""""""""""""""""""""
" Fixes inconsistent highlighting of ansible yaml files.
Plug 'pearofducks/ansible-vim'
" Elixir syntax highlighting
Plug 'elixir-lang/vim-elixir'
" Elm syntax highlighting
Plug 'ElmCast/elm-vim'
" Go syntax highlighting
Plug 'fatih/vim-go'
" Rust syntax highlighting.
Plug 'rust-lang/rust.vim'
" Terraform syntax highlighting.
Plug 'hashivim/vim-terraform'
" Toml syntax highlighting, mostly for rust and cargo files.
Plug 'cespare/vim-toml'

" Dependency of vim-markdown.
Plug 'godlygeek/tabular'
" Markdown syntax highlighting.
Plug 'plasticboy/vim-markdown'

" Recommended for vim-orgmode.
Plug 'tpope/vim-speeddating'
" Emacs org-mode but for vim.
Plug 'jceb/vim-orgmode'

""""""""""""""""
" COLORSCHEMES "
""""""""""""""""
" Current color scheme.
Plug 'ayu-theme/ayu-vim'
" Library of alternate color schemes.
Plug 'flazz/vim-colorschemes'
" Library of tab and modeline themes.
" Plug 'vim-airline/vim-airline-themes'
" Even more colorschemes!
Plug 'rafi/awesome-vim-colorschemes'
" And more colorschemes.
Plug 'chriskempson/base16-vim'

" Done installing plugins.
call plug#end()

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
let ayucolor="mirage"             " set ayu flavor (dark, mirage, light)
"colorscheme ayu                  " choose colorscheme
set bg=dark
colorscheme rakr

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
let maplocalleader="\\"
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
    \ foldmethod=indent

  let python_highlight_all = 1
  autocmd FileType python syn keyword pythonDecorator True None False self
augroup END

" rust
augroup filetype_rust
  autocmd!
  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap gs <Plug>(rust-def-split)
  au FileType rust nmap gx <Plug>(rust-def-vertical)
  au FileType rust nmap <leader>gd <Plug>(rust-doc)
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
" Display powerline characters instead of boxes.
" let g:airline_powerline_fonts=1
" Use airline for the tab bar too.
" let g:airline#extensions#tabline#enabled=1
" Set the theme for the modeline and tab bar.
" let g:airline_theme='lucius'

" indentline
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" Help text doesn't need to show the indent lines.
let g:indentLine_fileTypeExclude = ['help']

" markdown
let g:vim_markdown_frontmatter = 1 " highlight hugo frontmatter

" neocomplete
" Use deoplete.
let g:deoplete#enable_at_startup = 1  " use deoplete
" Rust completions for deoplete need to know the path to racer.
let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
" Rust completions also need the rust source cloned somewhere.
let g:deoplete#sources#rust#rust_source_path='~/src/rust/src'

" orgmode
let g:org_indent = 1

" signify
let g:signify_vcs_list = ['git', 'hg']

" neomake
" Run all relevant neomake makers on every write, and on a 750ms delay after
" normal mode changes.
call neomake#configure#automake('nw', 750)
