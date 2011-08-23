# TODO:
#   * Add asterix (*) to the prompt on unstaged changes

# Git installed via official installer
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Git installed via MacPorts
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash 
fi

# Load RVM 
if [ -f ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi

# Completion for git-flow 
if [ -f ~/.git-flow-completion.sh ]; then
    source ~/.git-flow-completion.sh
fi

# cleanup history a bit, make it so that we can share
# a common history between concurrent sessions
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000 HISTFILESIZE=1000000
shopt -s histappend

if [ -n "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
else
    PROMPT_COMMAND='history -a'
fi

# Override cd and track the last direcroty for new sessions
function cd {
    builtin cd "$@" 
    echo $PWD > ~/.bash_pwd
}
if [ -f ~/.bash_pwd ]; then
    cd $(cat ~/.bash_pwd)
fi

# Some very handy aliases
alias ll='ls -lGgh'
alias lla='ls -lGagh'
alias ..='cd ..'
alias grep='grep --color=auto'

# And a nice commandline prompt
if [ "$(id -u)" == "0" ]; then
    PS1='\[\033[31m\][$(date +%H:%M)]\[\033[34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[31m\]\$\[\033[00m\] '
else
    PS1='\[\033[32m\][$(date +%H:%M)]\[\033[34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[34m\]\$\[\033[00m\] '
fi
