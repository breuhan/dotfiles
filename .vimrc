" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Vundle Initialization ===============

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" ================ General Config ====================

set encoding=utf-8   " Default encoding
set fo+=o            " Auto insert the comment leader after "o" / "O"
set noerrorbells     " Disable the bell (beep or screen flash)
set pastetoggle=<F2> " Disable all kinds of smartness for pasting
set ttyfast          " Indicate fast terminal for smooth redrawing

set scrolloff=3      " Lines to keep above and below the cursor
set sidescrolloff=8  " Chars to keep while scrolling
set sidescroll=1     " Enable side scrolling

" change the mapleader from "\" to ","
let mapleader=","

" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" find conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>L mQviwU`Q
nmap <leader>l mQviwu`Q

" ================ Terminal stuff ===================

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" =================== File IO =======================

set autoread         " Reload files changed outside vim
au FocusLost * :wa   " Save when losing focus
set autowrite        " Writes on make/shell commands

" When vimrc is edited, reload it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ================ Search Settings ==================

" Allow tab-complete words while typing
Bundle 'SearchComplete'

set gdefault      " Default enable 'g' flag in substitue
set highlight=lub
set hlsearch      " Highlight searches by default
set incsearch     " Find the next match as we type
set showmatch

" Clear current search highlight
nmap <leader><space> :noh<cr>

" Center display line after searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 'Very magic' regexes in searches
nnoremap / /\v
nnoremap ? ?\v

" ================ Turn Off Swap Files ==============

set nobackup      " Don't make backups before overwriting files
set noswapfile    " Don't use swapfiles
set nowb          " Dont' make backups before writing files

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent      " Copy indent from current line when starting a new one
set expandtab       " Insert spaces instead of <Tab> in the insert mode
set smartindent     " Do smart autoindenting when starting a new lines
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Some syntax definitions
Bundle 'pangloss/vim-javascript'
Bundle 'michaelcontento/Monkey-VIM'
Bundle 'leshill/vim-json'
Bundle 'mutewinter/nginx.vim'
Bundle 'acustodioo/vim-tmux'
Bundle 'tpope/vim-git'

filetype plugin on
filetype indent on

" Usually 4 but JS is slightly different
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

" ============== Long line handling ================

set linebreak           " Wrap lines at convenient points
set nowrap              " Don't wrap lines

set colorcolumn=80      " Display the 80 columns marker
set textwidth=80        " Try to enforce a proper line length
set formatoptions=tcrql
    " t - autowrap to textwidth
    " c - autowrap comments to textwidth
    " r - autoinsert comment leader with <Enter>
    " q - allow formatting of comments with :gq
    " l - don't format already long lines

" Toggle screen wrapping of long lines
nnoremap <Leader>w :set invwrap<Bar>set wrap?<CR>

" Clear trailing spaces. _s is used to restore the last search pattern register
nnoremap <silent> <Leader>S :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" ================ Folds ============================

set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Toggle folding with <Space>
nnoremap <Space> za
vnoremap <Space> zf

" Open all folds automatically
autocmd BufRead,BufNewFile * normal zR

" Define folds automatically by indent level, but would also like to create
" folds manually. See: http://vim.wikia.com/wiki/Folding
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" ================ Completion =======================

set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~

" OSX
set wildignore+=*DS_Store*

" Files we're never gonna use vim for
set wildignore+=*.png,*.jpg,*.gif

" Common stuff
set wildignore+=*/log/**
set wildignore+=*/tmp/**
set wildignore+=.vagrant
set wildignore+=*vim/backups*

" Monkey
set wildignore+=*.build/**

" Python
set wildignore+=*.pyc,*.pyo

" NodeJS
set wildignore+=*/node_modules/**

" CakePHP
set wildignore+=*/app/tmp/**
set wildignore+=*/vendors/**

" ============== Custom mappings ====================

" Split line (opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

" Make Y not dumb
nnoremap Y y$

" Fuck you, manual key
nnoremap K <nop>

" ; is useless
nnoremap ; :

" Sudo write
cmap w!! w !sudo tee % >/dev/null

" And make j,k work
nnoremap j gj
nnoremap k gk

" Fix some common typos
command! W w
command! Q q

" Make line completion easier
imap <C-l> <C-x><C-l>

" Replace selection without copying into default register
vmap R "_dp

" Fix the backspace
vnoremap <BS> d
noremap <BS> dh
set backspace=indent,eol,start

" Edit vimrc in new tab
nnoremap <Leader>ev :split $MYVIMRC<CR>

" ============= Buffer management ===================

map <Leader>- :split<CR>
map <Leader>\| :vsplit<CR>
map <Leader>\ :vsplit<CR>

map <Leader><Left> <C-w><Left>
map <Leader><Right> <C-w><Right>
map <Leader><Down> <C-w><Down>
map <Leader><Up> <C-w><Up>

" Buffer movement with <leader> is consitent with tmux but somehow "painful" to
" use and therefore this alternative :)
map <M-S-Left> <Leader><Left>
map <M-S-Right> <Leader><Right>
map <M-S-Up> <Leader><Up>
map <M-S-Down> <Leader><Down>

" Automatically resize splits when resizing window
if has("autocmd")
  autocmd VimResized * wincmd =
endif

" =============== Tab management ====================

map <S-t> :tabnew<CR>
map <S-Left> :tabprev<CR>
map <S-Right> :tabnext<CR>

" ============ OSX like movement ====================

" Introduct new keycodes to vim for <alt-arrows>
set <F13>=[1;3C
map <F13> <M-Right>
map! <F13> <M-Right>

set <F14>=[1;3D
map <F14> <M-Left>
map! <F14> <M-Left>

set <F15>=[1;10C
map <F15> <S-M-Right>
map! <F15> <S-M-Right>

set <F16>=[1;10D
map <F16> <S-M-Left>
map! <F16> <S-M-Left>

set <F17>=[1;10A
map <F17> <S-M-Up>
map! <F17> <S-M-Up>

set <F18>=[1;10B
map <F18> <S-M-Down>
map! <F18> <S-M-Down>

" Jump words with alt-arrow (osx style)
map <M-Left> b
map <M-Right> w
imap <M-Left> <Esc>bi
imap <M-Right> <Esc><Right>wi

" Enable command movement
" TODO: Fix commad-up and command-down
map <D-Left> <C-a>
map <D-Right> <C-e>

" Mac bindings for home/end
imap <C-a> <Esc>^i
imap <C-e> <Esc>g$i
map <C-a> ^
map <C-e> g$

" =================== Theme =========================

set number           " Enable line numbers
set ruler            " Show the line and column number of the cursor
set showcmd          " Show incomplete commands down the bottom
set showmode         " Show current mode down the bottom
set cul              " Highlight the current line
" set background=dark  " Use the dark background color

" Bundle 'altercation/vim-colors-solarized'
" let g:solarized_termtrans=1
" let g:solarized_contrast="high"
" colorscheme solarized

Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans

" Turn on syntax highlighting. It's important to activate
" this AFTER we've loaded the theme!
syntax on

" Display trailing tabs and spaces visually
set list listchars=tab:\ \ ,trail:·

" ============== File navigation ====================

Bundle 'kien/ctrlp.vim'

nmap <Leader>O :CtrlPMRUFiles<CR>
let g:ctrlp_map = '<Leader>o'

let g:ctrlp_open_multiple_files = 'tr'
let g:ctrlp_arg_map = 1

let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.vim/ctrlp-cache'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 0

let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = {
  \ 'types': {
   \ 1: ['.git', 'cd %s && git ls-files --exclude-standard -co'],
   \ 2: ['.ctrlp_root_dir', 'find %s -type f'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }

" ============= Easier commenting ===================

Bundle 'tomtom/tcomment_vim'

map <leader>c <leader>__
map <leader>C <leader>_p

" ============ Plugin management ====================

" Vundle itself has to be loaded at the top

nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ==================== Supertab =====================

Bundle 'ervandew/supertab'

" let g:SuperTabDefaultCompletionType="context"
" let g:SuperTabCompletionContexts=["s:ContextText", "s:ContextDiscover"]
" let g:SuperTabContextTextOmniPrecedence=["&omnifunc", "&completefunc"]
" let g:SuperTabContextDiscoverDiscovery=["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

let g:SuperTabClosePreviewOnPopupClose=1
" g:SuperTabClosePreviewOnPopupClose is somehow buggy ...
" (Whole block copied from http://stackoverflow.com/a/3107159)
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ================= Hammer.Vim ======================

Bundle 'matthias-guenther/hammer.vim'
map <Leader>m :Hammer<CR>

" ================= Uncategorized ===================

" Easy manipulation of surroundings
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" Pretty tagbar for classes
Bundle 'majutsushi/tagbar'
map <Leader>t :TagbarOpenAutoClose<CR>

" Auto-update ctags
Bundle 'vim-scripts/AutoTag'

" Automatic closing of quotes, parenthesis, brackets, etc
Bundle 'Raimondi/delimitMate'

" Fast php manual lookup
Bundle 'michaelcontento/php-search-doc'

" Useful auto-complete snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'spf13/snipmate.vim'
Bundle 'spf13/snipmate-snippets'

" Swap parameters of a function or a comma separated list with a single command
Bundle 'mutewinter/swap-parameters'

"At every search command, it automatically prints:
" -->> At match #N out of M matches
Bundle 'henrik/vim-indexed-search'

" Search the current directory with Ack
Bundle 'mileszs/ack.vim'
nmap <Leader>a :Ack<Space>
nmap <Leader>A :AckFromSearch<CR>

" Easy zoom into and out of a window
Bundle 'ZoomWin'
nmap <Leader>z <c-w>o

" Extended % matching
Bundle 'matchit.zip'

" Graphical undo helper
Bundle 'Gundo'
nmap <Leader>U :GundoToggle<CR>

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END
