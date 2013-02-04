set backspace=2
set nowb
set nobk
syn on
"set ai!
set nu!
"set cin!
filetype indent on "indent depends on filetype
set smartindent
set tabstop=4
set shiftwidth=4

set list lcs=tab:\|\ 

menu Edit.Comment :s/^/#/<CR>
menu Edit.Uncomment :s/^#//<CR>

"filetype plugin indent on
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"
