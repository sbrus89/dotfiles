filetype on
syntax on

set number
set showmatch

let fortran_free_source=1
let fortran_more_recise=1
let fortran_do_enddo=1

set laststatus=2
set statusline=\ File:\ %f%m%r%h\ %w\ \ CWD:\ %{getcwd()}\ \ \ Line:\ %l/%L\ (%p%%)\ \ Column:\ %c\ \ Buffer:\ %n

set foldmethod=marker

set hlsearch
