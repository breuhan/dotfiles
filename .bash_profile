if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

alias ll='ls -lGgh'
alias lla='ls -lGagh'
alias ..='cd ..'
alias grep='grep --color=auto'

if [ "$(id -u)" == "0" ]; then
    PS1='\[\033[01;31m\][$(date +%H:%M)]\[\033[34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[31m\]\$\[\033[01;00m\] '
else
    PS1='\[\033[01;32m\][$(date +%H:%M)]\[\033[34m\] \w\[\033[31m\]$(__git_ps1 " (%s)") \[\033[34m\]\$\[\033[01;00m\] '
fi

# MacPorts Installer addition on 2010-08-27_at_21:42:16: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

