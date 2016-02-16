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

set ignorecase
set smartcase

set list lcs=tab:\|\ " for indent stick 
" for eol override
set whichwrap+=<,>,h,l,[,]

if (has("gui_running"))
	set cursorline " that grey thing at cursor
endif

if (has("gui_running"))
	set guifont=Droid\ Sans\ Mono " a nice monospace font
endif

" powerline
if (has("gui_running")) " for gvim
	let g:Powerline_symbols='fancy'
endif
set laststatus=2 " needed
set termencoding=utf-8 " x3, maybe not needed

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

" execute pathogen#infect() " for pathogen, commented out on purpose
