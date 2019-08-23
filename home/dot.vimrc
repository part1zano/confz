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
set clipboard=unnamedplus

set ignorecase
set smartcase

set list lcs=tab:\|\ " for indent stick
" for eol override
set whichwrap+=<,>,h,l,[,]

if (has("gui_running"))
	set cursorline " that grey thing at cursor
	" set guifont=Droid\ Sans\ Mono " a nice monospace font
	set guifont=Input\ 10
	colorscheme molokai " colorscheme ideal for gui mode
else
	colorscheme Monokai " like the one before, but for non-gui mode
endif

" airline
if (has("gui_running"))
	let g:airline_powerline_fonts = 1
endif

" filetype plugin indent on
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor = "latex"


" More suitable mapping
function! SMap(key, action, ...)
	let modes = " vi"
	if (a:0 > 0)
		let modes = a:{1}
	endif
	if (match(modes, '\Ii') != -1)
		execute 'imap ' . a:key . ' <Esc>' . a:action
	endif
	if (match(modes, '\Nn') != -1)
		execute 'nmap ' . a:key . ' <Esc>' . a:action
	endif
	if (match(modes, ' ') != -1)
		execute 'map ' . a:key . ' <Esc>' . a:action
	endif
	if (match(modes, '\Vv') != -1)
		execute 'vmap ' . a:key . ' <Esc>' . a:action
	endif
endfunction


call SMap("<F2>", ":w<cr>")
au FocusLost * :wa

set history=64
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

set incsearch " for more convenient search

" for pathogen, commented out on purpose
" execute pathogen#infect()

autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType cmake setlocal commentstring=#\ %s

" let g:clighter_libclang_file='/usr/local/llvm38/lib/libclang.so.3.8'

" call SMap("<C-x>r", ":call clighter#Rename()<cr>")
let g:jedi#rename_command='<C-x>R'

" ale
let g:ale_c_clang_options='-I/usr/local/include'
let g:ale_cpp_clang_options='-I/usr/local/include'

" the following is just an example
"
" function Tabstop()
" 	set expandtab
" 	set shiftwidth=4
" 	set tabstop=4
" 	set softtabstop=4
" endfunction

" autocmd filetype c call Tabstop()
" autocmd filetype cpp call Tabstop()
