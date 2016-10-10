source $HOME/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
	brew
	brew-cask
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
EOBUNDLES

antigen bundle $HOME/.dotfiles/zsh-custom

antigen bundle zsh-users/zsh-completions src

antigen theme dpoggi

antigen apply


