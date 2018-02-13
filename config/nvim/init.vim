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

filetype plugin indent on
set t_Co=256
syntax enable

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

" VimFiler
let mapleader=" "
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern='\(^\.\|\~$\|\.pyc$\|\.git\|\.[oad]$\)'
nnoremap ;; :VimFiler -buffer-name=explorer -split -winwidth=30 -toggle -no-quit<Cr>
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_edit_action = 'tabopen'


" ctags
nnoremap <C-]> g<C-]>

" rainbowparenthes
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" react-reason
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

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

