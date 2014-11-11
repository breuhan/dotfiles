source $HOME/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    atom
	brew
	brew-cask
	colored-man
	command-not-found
	dirpersist
	emoji-clock
	encode64
	extract
	gem
	git-extras
	gnu-utils
	history
	iwhois
	jsontools
	nvm
	pep8
	pip
	postgres
	pyenv
	pylint
	python
	redis-cli
	rsync
	sudo
	vundle
	xcode
EOBUNDLES

antigen bundle michaelcontento/zsh-aliases
antigen bundle michaelcontento/zsh-config
antigen bundle michaelcontento/zsh-fastgit
antigen bundle michaelcontento/zsh-monkey
antigen bundle michaelcontento/zsh-osx_bindkey
antigen bundle michaelcontento/zsh-path
antigen bundle michaelcontento/zsh-terminate_vbox

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle $HOME/.dotfiles/zsh-custom

antigen theme dpoggi

antigen apply

# Make vim the default editor
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

ulimit -n 1024
export HISTSIZE=100000000
export HISTCONTROL=erasedups

