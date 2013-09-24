set backspace=2
set nowb
set nobk
syn on
set nu!
filetype indent on "indent depends on filetype
filetype on
filetype plugin on
set smartindent
set tabstop=4 "for compatibility
set shiftwidth=4 "same as above
set clipboard=unnamed

" for eol override
set whichwrap+=<,>,h,l,[,]

" for indent stick
set list lcs=tab:\|\ 

if (has("gui_running"))
	set cursorline "that grey thing at cursor
endif

" powerline
if (has("gui_running")) " for gvim
	let g:Powerline_symbols='fancy'
endif
set laststatus=2 " needed
set termencoding=utf-8 " x3, maybe not needed

"filetype plugin indent on
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"
