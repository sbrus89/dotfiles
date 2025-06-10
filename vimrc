call pathogen#infect()

filetype on
syntax on

set number
set showmatch

let fortran_free_source=1
let fortran_more_recise=1
let fortran_do_enddo=1
let fortran_have_tabs=1

set laststatus=2
set statusline=\ File:\ %f%m%r%h\ %w\ \ CWD:\ %{getcwd()}\ \ \ Line:\ %l/%L\ (%p%%)\ \ Column:\ %c\ \ Buffer:\ %n

set foldmethod=marker

set hlsearch

inoremap kj <Esc>
nnoremap <C-N><C-N> :set invnumber<CR>

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
