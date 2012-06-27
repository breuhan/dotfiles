syntax on
colorscheme darkblue
set smartindent
set autoindent
set smarttab
set ic " ignore case in search
set incsearch " incremental search
set hlsearch " highlight search results
set smartcase " ignore case when lowercase
set number



set viminfo='10,\"100,:20,%,n~/.viminfo

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
