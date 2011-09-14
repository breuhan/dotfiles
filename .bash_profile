#
# GIT
#

export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1

if [ -f /opt/local/etc/bash_completion ]; then
    # Installed via MacPorts
    source /opt/local/etc/bash_completion
fi
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    # Installed via official installer
    source /usr/local/git/contrib/completion/git-completion.bash 
fi

if [ -f ~/.git-flow-completion.sh ]; then
    source ~/.git-flow-completion.sh
fi

#
# BASH - SSH COMPLETION
#

if [ -f ~/.ssh-completion.sh ]; then
    source ~/.ssh-completion.sh
fi

#
# RVM
#

if [ -f ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi

#
# EC2
#

if [ -f ~/.ec2/environment ]; then
    source ~/.ec2/environment
fi

#
# BASH - HISTORY
#

export HISTCONTROL=ignoreboth
export HISTSIZE=1000000 
export HISTFILESIZE=1000000
shopt -s histappend

if [ -n "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
else
    PROMPT_COMMAND='history -a'
fi

#
# BASH - INTELLIGENT cd 
#

function cd {
    builtin cd "$@" 
    echo $PWD > ~/.bash_pwd
}

if [ -f ~/.bash_pwd ]; then
    cd $(cat ~/.bash_pwd)
fi

#
# BASH - AlIASES
#

alias ll='ls -lGgh'
alias lla='ls -lGagh'
alias ..='cd ..'
alias grep='grep --color=auto'

#
# BASH - PROMPT
#

if [ "$(id -u)" == "0" ]; then
    PS1='\[\033[31m\][$(date +%H:%M)]\[\033[34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[31m\]\$\[\033[00m\] '
else
    PS1='\[\033[32m\][$(date +%H:%M)]\[\033[34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[34m\]\$\[\033[00m\] '
fi

#
# CUSTOM PATH EXTENSION
#
export PATH=~/.bin/:${PATH}
