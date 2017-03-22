set shell=/bin/bash
if has('vim_starting')
if &compatible
  set nocompatible
  endif
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

  call dein#begin(expand('~/.vim/dein'))
	call dein#add('Shougo/unite.vim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('pangloss/vim-javascript')
	call dein#add('OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } })
	call dein#add('osyo-manga/shabadou.vim')
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('https://github.com/powerline/powerline.git', { 'rtp' : 'powerline/bindings/vim'})
	call dein#add('szw/vim-tags')
	call dein#add('thinca/vim-ref')
	call dein#add('yuku-t/vim-ref-ri')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('osyo-manga/shabadou.vim')
	call dein#add('OmniSharp/omnisharp-vim')
	call dein#add('scrooloose/syntastic')
	call dein#add('elixir-lang/vim-elixir')
	call dein#add('vim-ruby/vim-ruby')
	call dein#add('dracula/vim')
	call dein#add('plasticboy/vim-markdown')
	call dein#add('udalov/kotlin-vim')
   call dein#end()
   if dein#check_install()
        call dein#install()
   endif
   filetype plugin indent on
   set t_Co=256
   syntax on
   color dracula
   set guifont=SauceCodePowerline-Regular:h14
   set statusline+=%#warningmsg#
   set statusline+=%{SyntasticStatuslineFlag()}
   set statusline+=%*
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
   augroup HighlightTrailingSpaces
	autocmd!
	autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
	autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
   augroup END
  nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
endif

set showtabline=2   " タブを常に表示
set imdisable   " IMを無効化

set expandtab
set tabstop=4
set shiftwidth=4

set noswapfile
let g:indent_guides_enable_on_vim_startup = 1
let g:vim_markdown_folding_disabled = 1
