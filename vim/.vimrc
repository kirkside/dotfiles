" === vim-plug ===

	" Make sure vim-plug is set up
	" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	
	call plug#begin()
	
		" Editor Features
			Plug 'mattn/emmet-vim'
			Plug 'chrisbra/csv.vim'
			Plug 'itchyny/lightline.vim'
			Plug 'tpope/vim-surround'
		
		" Language/Syntax
			
		" Colorschemes
			Plug 'kaicataldo/material.vim', { 'branch': 'main' }
			"Plug 'drewtempelmeyer/palenight.vim'
	
	call plug#end()

" === Plugin Config ===

	" material.vim
		let g:material_terminal_italics = 1
		let g:material_theme_style = 'palenight'
	
	" lightline
		" Options include: ['material_vim'];
		let g:lightline = {
		\	'colorscheme': 'material_vim',
		\	'active': {
		\	  	'left': [
		\			['mode', 'paste' ],
		\			['gitbranch', 'readonly', 'filename', 'modified' ]
		\		]
		\	},
		\	'component_function': {
		\		'gitbranch': 'fugitive#head',
		\		'filename': 'LightLineFilename'
		\	}
		\}
		
		
		" https://github.com/itchyny/lightline.vim/issues/87#issuecomment-119130738
		function! LightLineFilename()
			return expand('%')
		endfunction
		
		" lightline-bufferline
		let g:lightline#bufferline#show_number = 2
		let g:lightline#bufferline#filename_modifier = ':t'
		let g:lightline.tabline = { 'left': [ [ 'buffers' ] ], 'right': [] }
		let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
		let g:lightline.component_type = { 'buffers': 'tabsel' }
		
		autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
		
" === General settings ===

	set encoding=utf-8

	" visuals
	if (has("termguicolors"))
  		set termguicolors
	else
		set t_Co=256
	endif

	" options include: ['material']
		colorscheme material

	" numbers
	 	set number
	
	" status line
	
	" tabs
		set tabstop=4
	
	" indentation
		set autoindent	
	" folding
	
	" search
		set hlsearch	
	" word wrapping
		set nowrap
	
	" Remove trailing whitespace
		let s:isremovingwhitespace = 1

		function! RemoveTrailingWhitespace()
  			if (s:isremovingwhitespace == 1)
    			let l = line('.')
    			let c = col('.')
    			%s/\s\+$//e
    			call cursor(l, c)
  			endif
		endfun

" syntax on
" filetype plugin on
" packloadall
