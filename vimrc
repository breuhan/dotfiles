call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on
colorscheme darkblue
set smartindent
set autoindent
set smarttab
set ic " ignore case in search
set incsearch " incremental search
set hlsearch " highlight search results
set smartcase " ignore case when lowercase
set number " Line numbers
set textwidth=0 " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " line and column number of the cursor position
set wildmenu " enhanced command completion
set autowriteall " Automatically save before commands like :next and :make
set autoread " automatically read feil that has been changed on disk and doesn't have changes in vim

set viminfo='10,\"100,:20,%,n~/.viminfo

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set shell=/bin/bash     " use bash for shell commands

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

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

function! ResCur()
	if line("'\"") <= line("$")
	normal! g`"
	return 1
	endif
	endfunction

	augroup resCur
	autocmd!
autocmd BufWinEnter * call ResCur()
	augroup END
