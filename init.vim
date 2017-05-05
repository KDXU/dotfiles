if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
    let s:toml = '~/.dein.toml'
    call dein#load_toml(s:toml,      {'lazy': 0})
call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
set t_Co=256
syntax enable

set background=dark
colorscheme molokai
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showbreak=↪
set list
set number
set autoindent
set title
set showtabline=2
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile

"日本語(マルチバイト文字)行の連結時には空白を入力しない。
set formatoptions+=mM

"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

highlight ExtraWhitespace ctermbg=red guibg=#FA5882
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

let g:vim_markdown_folding_disabled = 1

" deoplete.vim
let g:deoplete#enable_at_startup = 1

" ctrlp.vim
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_root_markers = ['mix.exs', 'Gemfile', 'pom.xml', 'build.xml']
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \}
let g:airline#extensions#tabline#enabled = 1

nnoremap <silent><C-e> :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>
