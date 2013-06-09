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

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" find conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>L mQviwU`Q
nmap <leader>l mQviwu`Q

" Look for tag def in a "tags" file in the dir of the current file, then for
" that same file in every folder above the folder of the current file, until
" the root.
set tags=./tags;/

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" CTRL-U and CTRL-W in insert mode cannot be undone.  Use CTRL-G u to first
" break undo, so that we can undo those changes after inserting a line break.
" For more info, see: http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

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

set fileformat=unix            " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order
" ================ Search Settings ==================

" Allow tab-complete words while typing
Bundle 'SearchComplete'

set gdefault      " Default enable 'g' flag in substitue
set highlight=lub
set hlsearch      " Highlight searches by default
set incsearch     " Find the next match as we type
set ignorecase    " case insensitive searching
set smartcase     " but become case sensitive if you type uppercase characters
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

" ================ Tune Backup Files ==============

set nobackup      " Don't make backups before overwriting files
set nowb          " Dont' make backups before writing files

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
set undodir=~/.vim/backups
set undofile

set history=10000        " remember more commands and search history
set undolevels=10000     " use many levels of undo"

" ================ Indentation ======================

set autoindent      " on new lines, match indent of previous line
set copyindent      " copy the previous indentation on autoindenting
set expandtab       " Insert spaces instead of <Tab> in the insert mode

set smartindent
set autoindent

set number " Line numbers
set textwidth=0 " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmenu " enhanced command completion
" Whitespace stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Some syntax definitions
Bundle 'pangloss/vim-javascript'
Bundle 'michaelcontento/Monkey-VIM'
Bundle 'leshill/vim-json'
Bundle 'mutewinter/nginx.vim'
Bundle 'acustodioo/vim-tmux'
Bundle 'tpope/vim-git'

set viminfo='10,\"100,:20,%,n~/.viminfo
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set shell=/bin/bash     " use bash for shell commands
filetype plugin on
filetype indent on

" Usually 4 but JS is slightly different
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

"See help completion for source,
	"Note: usual completion is on <C-n> but more trouble to press all the time.
	"Never type the same word twice and maybe learn a new spellings!
	"Use the Linux dictionary when spelling is in doubt.
	"Window users can copy the file to their machine.

function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
	return "\<C-N>"
	else
	return "\<Tab>"
	endif
	endfunction
	:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
	:set dictionary="/usr/dict/words"
" ============== Long line handling ================

set linebreak           " Wrap lines at convenient points
set nowrap              " Don't wrap lines
function! ResCur()
	if line("'\"") <= line("$")
	  normal! g`"
	  return 1
	endif
endfunction

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
augroup resCur
	autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" ================ Completion =======================

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu            " completion with menu

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab
" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" compiled stuff
set wildignore=*.o,*.obj,*~
" Disable code folding
set nofoldenable

" OSX
set wildignore+=*DS_Store*
" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Files we're never gonna use vim for
set wildignore+=*.png,*.jpg,*.gif

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Common stuff
set wildignore+=*/log/**
set wildignore+=*/tmp/**
set wildignore+=.vagrant
set wildignore+=*vim/backups*
" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4
" Monkey
set wildignore+=*.build/**

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
" Python
set wildignore+=*.pyc,*.pyo

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" NodeJS
set wildignore+=*/node_modules/**

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
" CakePHP
set wildignore+=*/app/tmp/**
set wildignore+=*/vendors/**

au BufRead,BufNewFile *.txt call s:setupWrapping()
" ============== Custom mappings ====================

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
" Split line (opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

" allow backspacing over everything in insert mode
" Make Y not dumb
nnoremap Y y$

" Fuck you, manual key
nnoremap K <nop>

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

nmap <Leader>- :split<CR>
nmap <Leader>\| :vsplit<CR>
nmap <Leader>\ :vsplit<CR>

nmap <Leader><Left> <C-w><Left>
nmap <Leader><Right> <C-w><Right>
nmap <Leader><Down> <C-w><Down>
nmap <Leader><Up> <C-w><Up>

" Buffer movement with <leader> is consitent with tmux but somehow "painful" to
" use and therefore this alternative :)
nmap <M-S-Left> <Leader><Left>
nmap <M-S-Right> <Leader><Right>
nmap <M-S-Up> <Leader><Up>
nmap <M-S-Down> <Leader><Down>

" Automatically resize splits when resizing window
if has("autocmd")
  autocmd VimResized * wincmd =
endif

" =============== Tab management ====================

nmap <S-t> :tabnew<CR>
nmap <S-Left> :tabprev<CR>
nmap <S-Right> :tabnext<CR>

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
nmap <M-Left> b
nmap <M-Right> w
imap <M-Left> <Esc>bi
imap <M-Right> <Esc><Right>wi

" Enable command movement
" TODO: Fix commad-up and command-down
nmap <D-Left> <C-a>
nmap <D-Right> <C-e>

" Mac bindings for home/end
imap <C-a> <Esc>^i
imap <C-e> <Esc>g$i
nmap <C-a> ^
nmap <C-e> g$

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
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 0

let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.png$|\.jpg$|\.gif$'
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files --exclude-standard -co | egrep -v "\.(gif|jpg|png|ttf)$"'],
  \ 2: ['.ctrlp_root_dir', 'find %s -type f'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }
" ============= Easier commenting ===================

Bundle 'tomtom/tcomment_vim'

nmap <leader>c <leader>__
nmap <leader>C <leader>_p

" ============ Plugin management ====================

" Vundle itself has to be loaded at the top

nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" ================= Uncategorized ===================

" Easy manipulation of surroundings
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" Pretty tagbar for classes
Bundle 'majutsushi/tagbar'
map <Leader>t :TagbarOpenAutoClose<CR>

" Automatic closing of quotes, parenthesis, brackets, etc
Bundle 'Raimondi/delimitMate'

"At every search command, it automatically prints:
" -->> At match #N out of M matches
Bundle 'henrik/vim-indexed-search'

" Easy zoom into and out of a window
Bundle 'ZoomWin'
nmap <Leader>z <c-w>o

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

Bundle 'Valloric/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 7
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

Bundle 'suan/vim-instant-markdown'
" gem install redcarpet pygments.rb
" npm -g install instant-markdown-d

Bundle 'Lokaltog/vim-easymotion'

" toggle cursor line hightlight with inset/edit mode
:autocmd InsertEnter,InsertLeave * set cul!

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

" set makeprg=/Applications/Monkey/bin/trans_macos\ -config=debug\ -target=glfw\ -run\ %
" nmap <Leader>r :make<CR>

Bundle 'airblade/vim-gitgutter'
au BufWinEnter * sign define mysign
au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')

highlight clear SignColumn

" Bundle 'wikitopian/hardmode'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" " relative numbers FTW
" set rnu
" au InsertEnter * :set nu
" au InsertLeave * :set rnu
" au FocusLost * :set nu
" au FocusGained * :set rnu

Bundle 'Lokaltog/vim-easymotion'

Bundle 'hwrod/interactive-replace'
