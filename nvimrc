if &compatible
  set nocompatible
endif

" dein.vim
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

colorscheme molokai

set mouse=a
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set showbreak=↪
set list

"日本語(マルチバイト文字)行の連結時には空白を入力しない。
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
set clipboard=unnamed

highlight Normal ctermbg=NONE

highlight ExtraWhitespace ctermbg=red guibg=#FA5882
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" denite.nvim
nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR>

let g:vim_markdown_folding_disabled = 1

" deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
"
" tig
nnoremap tig :<C-u>w<CR>:te tig status<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '


" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
noremap ;; :VimFiler -split -simple -winwidth=35 -no-quit<ENTER>

