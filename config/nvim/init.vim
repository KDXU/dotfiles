if &compatible
  set nocompatible
endif

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
set background=dark
colorscheme hybrid
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

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20

" ctags
nnoremap <C-]> g<C-]>

" denite
nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>
" grep
nnoremap <silent> ;cg :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" 普通にgrep
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search -mode=normal grep<CR>"
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [
      \ '.git/', 'build/', '__pycache__/',
      \ 'images/', '*.o', '*.make',
      \ '*.min.*',
      \ 'img/', 'fonts/'])

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" gocode
let g:deoplete#sources#go#gocode_binary = '$HOME/go/bin/gocode'

au BufRead,BufNewFile /nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

" markdown
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown
