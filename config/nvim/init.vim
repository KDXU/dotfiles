if &compatible
  set nocompatible
endif

filetype plugin indent on
syntax enable

set shell=/bin/zsh
set t_Co=256
autocmd ColorScheme * highlight Comment ctermfg=165 guifg=#FFFFFF
set background=dark
set mouse=a
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showbreak=↪
set list
set formatoptions+=mM
set number relativenumber
set nonumber norelativenumber
set number! relativenumber!
set title
set showtabline=2
set shiftwidth=2
set tabstop=2
set cursorline
set expandtab
set noswapfile
set conceallevel=0
set laststatus=2
set backspace=indent,eol,start


if has("mac")
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
end

highlight Normal ctermbg=NONE


nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>


let g:indentLine_setConceal = 0


