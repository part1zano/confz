set backspace=2
set nowb
set nobk
syn on
"set ai!
set nu!
"set cin!
filetype indent on "indent depends on filetype
set smartindent
set tabstop=4 "for compatibility
set shiftwidth=4 "same as above
set clipboard=unnamed

" for indent stick
set list lcs=tab:\|\ 

" powerline
if (has("gui_running")) " for vim
	let g:Powerline_symbols='fancy'
endif
set laststatus=2 " needed
set termencoding=utf-8 " x3, maybe not needed

"filetype plugin indent on
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"
