if &compatible
  set nocompatible
endif

" dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein/')
" Required:
  call dein#begin('~/.cache/dein/')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  let s:toml = '~/.dein.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#end()
endif

if dein#check_install()
  call dein#install()
endif

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20

filetype plugin indent on
set t_Co=256
syntax enable

set mouse=a
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showbreak=↪
set list
set formatoptions+=mM
set number
set autoindent
set title
set showtabline=2
set shiftwidth=2
set tabstop=2
set cursorline
set expandtab
set noswapfile

if has("mac")
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
end

highlight Normal ctermbg=NONE

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ctags
nnoremap <C-]> g<C-]>
