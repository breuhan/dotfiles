# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh-custom

# Set name of the theme to load.
ZSH_THEME_PREFIX_OSX=1
ZSH_THEME_PREFIX_ROOT=1
ZSH_THEME_USE_RPROMPT=1
ZSH_THEME="dpoggi"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Enable colors in ls
DISABLE_LS_COLORS="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# -> Special stuff for OSX
plugins=(gnu-utils osx-bindkey brew-fixes)

# -> PATH modifications
# TODO: virtualenv temporary disabled for speed
plugins=($plugins awsenv nvm rbenv pyenv)

# -> Functions
plugins=($plugins lastcd extract fastgit terminate_vbox scm_update)

# -> Only some aliases
plugins=($plugins python aliases monkey history encode64)

# -> Only completion
plugins=($plugins redis-cli bundler pip vagrant npm git-flow)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect complete
unsetopt correct_all

# Load and run compinit
autoload -U compinit
compinit -i
