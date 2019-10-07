if &compatible
  set nocompatible
endif

" for Python
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
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

let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

filetype plugin indent on
syntax enable

set t_Co=256
colorscheme iceberg
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


if has("mac")
  set clipboard=unnamed
elseif has("unix")
  set clipboard=unnamedplus
end

highlight Normal ctermbg=NONE

" ctags
nnoremap <C-]> g<C-]>

" バッファ切り替え
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" nginx
au BufRead,BufNewFile /nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

" gin 用 tmpl
au BufNewFile,BufRead *.tmpl set ft=html

" markdown
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

let g:flow#showquickfix = 0
let g:indentLine_setConceal = 0

let g:vim_jsx_pretty_highlight_close_tag = 1

" html
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint']

