" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set encoding=utf-8   " Default encoding
set noerrorbells     " Disable the bell (beep or screen flash)
set pastetoggle=<Leader>p " Disable all kinds of smartness for pasting
set ttyfast          " Indicate fast terminal for smooth redrawing

set scrolloff=3      " Lines to keep above and below the cursor
set sidescrolloff=8  " Chars to keep while scrolling
set sidescroll=1     " Enable side scrolling

syntax on
filetype plugin indent on
colorscheme darkblue
" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
