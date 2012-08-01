# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME_PREFIX_OSX=1
ZSH_THEME_PREFIX_ROOT=1
ZSH_THEME_USE_RPROMPT=1
ZSH_THEME="miloshadzic"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Enable colors in ls
DISABLE_LS_COLORS="false"

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# -> Special stuff for OSX
plugins=(gnu-utils osx-bindkey)
# -> PATH modifications
plugins=($plugins awsenv rbenv pythonbrew virtualenv nvm)
# -> Functions
plugins=($plugins lastcd extract fastgit terminate_vbox scm_update)
# -> Only some aliases
plugins=($plugins python aliases monkey)
# -> Only completion
plugins=($plugins redis-cli bundler pip npm git-flow vagrant gem)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect complete
unsetopt correct_all
