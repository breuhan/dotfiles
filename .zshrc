source $HOME/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle atom
antigen bundle brew
antigen bundle brew-cask
antigen bundle colored-man
antigen bundle command-not-found
antigen bundle dirpersist
antigen bundle emoji-clock
antigen bundle encode64
antigen bundle extract
antigen bundle gem
antigen bundle git-extras
antigen bundle gnu-utils
antigen bundle history
antigen bundle iwhois
antigen bundle jsontools
antigen bundle nvm
antigen bundle pep8
antigen bundle pip
antigen bundle postgres
antigen bundle pyenv
antigen bundle pylint
antigen bundle python
antigen bundle rbenv
antigen bundle redis-cli
antigen bundle rsync
antigen bundle sudo
antigen bundle vundle
antigen bundle xcode

antigen bundle michaelcontento/zsh-aliases
antigen bundle michaelcontento/zsh-config
antigen bundle michaelcontento/zsh-fastgit
antigen bundle michaelcontento/zsh-monkey
antigen bundle michaelcontento/zsh-osx_bindkey
antigen bundle michaelcontento/zsh-path
antigen bundle michaelcontento/zsh-terminate_vbox

antigen bundle zsh-users/zsh-syntax-highlighting

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

# Load and run compinit
autoload -U compinit
compinit -i


ulimit -n 1024
HISTSIZE=10000
export HISTCONTROL=erasedups

