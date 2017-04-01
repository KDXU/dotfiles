if &compatible
  set nocompatible
endif

" dein.vim
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
    let s:toml = '~/.dein.toml'
    let s:lazy_toml = '~/.dein_lazy.toml'
    call dein#load_toml(s:toml,      {'lazy': 0})
call dein#end()

if dein#check_install()
    dein#install()
endif

filetype plugin indent on
set t_Co=256
syntax enable

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set listchars=tab:>-
set list
set number
set autoindent
set title
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Unite.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

set showtabline=2   " タブを常に表示
set imdisable   " IMを無効化
set expandtab
set tabstop=4
set shiftwidth=4

set noswapfile
let g:indent_guides_enable_on_vim_startup = 1
let g:vim_markdown_folding_disabled = 1
let g:go_fmt_command = "goimports"

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#00aced ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#305097 ctermbg=4

color dracula
