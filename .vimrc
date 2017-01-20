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
			NeoBundle 'Shougo/neocomplete.vim'
			NeoBundle 'Shougo/neocomplete-rsence.vim'
			NeoBundle 'Shougo/neoinclude.vim'
			NeoBundle 'pangloss/vim-javascript'
			NeoBundle 'osyo-manga/shabadou.vim'
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
			NeoBundle 'scrooloose/nerdtree'
			NeoBundle 'elixir-lang/vim-elixir'
			NeoBundle 'dracula/vim'
			NeoBundleCheck
			call neobundle#end()
			filetype plugin indent on
			set t_Co=256
			syntax on
			color dracula
			set statusline+=%#warningmsg#
			set statusline+=%{SyntasticStatuslineFlag()}
			set statusline+=%*
			set encoding=utf-8
			set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
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

