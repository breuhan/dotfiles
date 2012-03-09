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

" =================== File IO  ======================

set autoread         " Reload files changed outside vim
au FocusLost * :wa   " Save when losing focus
set autowrite        " Writes on make/shell commands

" When vimrc is edited, reload it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ================ Search Settings  =================

" Allow tab-complete words while typing
Bundle 'SearchComplete'

set gdefault      " Default enable 'g' flag in substitue
set highlight=lub
set hlsearch      " Highlight searches by default
set ignorecase    " Makes searching a lot easier
set incsearch     " Find the next match as we type
set showmatch
set smartcase     " Override ignorecase on upper case search string

" Clear current search highlight
nmap <leader><space> :noh<cr>

" Center display line after searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

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

filetype plugin on
filetype indent on

" Display trailing tabs and spaces visually
set list listchars=tab:\ \ ,trail:·

" Clear trailing spaces. _s is used to restore the last search pattern register
nnoremap <silent> <Leader>S :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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

" ================ Folds ============================

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Toggle folding with <Space>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

" ================ Completion =======================

set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*

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

" Fix the backspace
vnoremap <BS> d
noremap <BS> dh

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

" =============== Tab management ====================

map <S-t> :tabnew<CR>
map <S-Left> :tabnext<CR>
map <S-Right> :tabprev<CR>

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
set background=dark  " Use the dark background color

Bundle 'altercation/vim-colors-solarized'

let g:solarized_termtrans=1
let g:solarized_contrast="high"
colorscheme solarized

" Turn on syntax highlighting. It's important to activate
" this AFTER we've loaded the theme!
syntax on

" ============== File navigation ====================

Bundle 'L9'
Bundle 'FuzzyFinder'

nmap <leader>y :FufFileWithCurrentBufferDir<CR>
nmap <leader>u :FufTaggedFile<CR>

" ============= Easier commenting ===================

Bundle 'tomtom/tcomment_vim'

map <leader>c <leader>__
map <leader>C <leader>_p

" ========= Preview markup languages ================

Bundle 'robgleeson/hammer.vim'

map <leader>p :Hammer<CR>

" ============ Plugin management ====================

" Vundle itself has to be loaded at the top

nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ========== Tabular formating of block =============

Bundle 'godlygeek/tabular'

nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=><CR>
vmap <Leader>t> :Tabularize /=><CR>
nmap <Leader>ts :Tabularize / \zs<CR>
vmap <Leader>ts :Tabularize / \zs<CR>

" ================ Tag browser ======================

Bundle 'taglist.vim'

map <Leader>h :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 45
let Tlist_GainFocus_On_ToggleOpen= 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0

" =============== Syntax checks =====================

Bundle 'scrooloose/syntastic'

let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
map <Leader>sc :SyntasticCheck<CR>

" ================= Uncategorized ===================

" Easy manipulation of surroundings
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" Pretty tagbar for classes
Bundle 'majutsushi/tagbar'

" Creating new gists
Bundle 'mattn/gist-vim'
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_private=1
let g:gist_show_privates=1

" Automatic closing of quotes, parenthesis, brackets, etc
Bundle 'Raimondi/delimitMate'

" Perform insert completion using <Tab>
Bundle 'ervandew/supertab'

" Fast php manual lookup
Bundle 'michaelcontento/php-search-doc'
