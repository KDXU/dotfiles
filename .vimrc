set shell=/bin/bash
if has('vim_starting')
	  set nocompatible
	    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		        echo "install neobundle..."
			    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
			      endif
			        set runtimepath+=~/.vim/bundle/neobundle.vim/
			endif
			call neobundle#begin(expand('~/.vim/bundle'))
			let g:neobundle_default_git_protocol='https'
			NeoBundleFetch 'Shougo/neobundle.vim'
			NeoBundle 'scrooloose/nerdtree'
			NeoBundle 'Shougo/neocomplete.vim'
			NeoBundle 'Shougo/unite.vim'
			NeoBundle 'pangloss/vim-javascript'
			NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }
			NeoBundle 'osyo-manga/shabadou.vim'
			NeoBundle 'https://github.com/powerline/powerline.git', { 'rtp' : 'powerline/bindings/vim'}
			NeoBundle 'szw/vim-tags'
			NeoBundle 'thinca/vim-ref'
			NeoBundle 'yuku-t/vim-ref-ri'
			NeoBundleLazy 'OmniSharp/omnisharp-vim', {
			      \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
			      \   'build': {
			      \     'windows' : 'msbuild server/OmniSharp.sln',
			      \     'mac': 'xbuild server/OmniSharp.sln',
			      \     'unix': 'xbuild server/OmniSharp.sln',
			      \   },
			     \ }
			NeoBundle 'scrooloose/syntastic'
			NeoBundle 'elixir-lang/vim-elixir'
			NeoBundle 'vim-ruby/vim-ruby'
			NeoBundle 'dracula/vim'
			NeoBundleCheck
			call neobundle#end()
filetype plugin indent on
set t_Co=256
syntax on
color dracula
set guifont=SauceCodePowerline-Regular:h14
set antialias
set encoding=utf8
set fenc=utf-8
set fileformats=unix,dos,mac
set listchars=tab:>-
set list
set number
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:neocomplete#enable_at_startup=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
augroup HighlightTrailingSpaces
		autocmd!
		autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
		autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
noremap O :<C-u>call append(expand('.'), '')<Cr>j


if has("gui_vimr")
set color dracula
endif


set expandtab
set tabstop=4
set shiftwidth=4

set noswapfile
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
