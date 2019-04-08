if &compatible
  set nocompatible
endif


" python3 以外全部無効
let g:python3_host_prog = expand('~/.pyenv/shims/python3')
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 1
let g:loaded_node_provider = 1

" dein.vim
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.cache/dein/'))
  call dein#begin(expand('~/.cache/dein/'))
  call dein#add('Shougo/dein.vim')
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set t_Co=256
colorscheme jellybeans
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
set autoindent
set title
set showtabline=2
set shiftwidth=2
set tabstop=2
set cursorline
set expandtab
set noswapfile
set conceallevel=0

if has("mac")
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
end

highlight Normal ctermbg=NONE

" ale
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-eslint']
let g:ale_linters = {
      \'javascript': ['eslint', 'flow']
      \}

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20

" ctags
nnoremap <C-]> g<C-]>

" バッファ切り替え
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" nginx
au BufRead,BufNewFile /nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

" markdown
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

let g:flow#showquickfix = 0
let g:indentLine_setConceal = 0
