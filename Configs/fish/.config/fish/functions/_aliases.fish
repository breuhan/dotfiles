# Colorize grep output (good for log files)
alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'

# Confirm before overwriting
alias cp 'cp -Ri'
alias mv 'mv -i'
alias rm 'rm -i'

# rsync shortcuts
alias rcp 'rsync -avP --progress'
alias rmv 'rsync -avP --progress --remove-source-files'


# Git shortcuts
alias gs 'git status'
alias git-recursive-pull 'find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'

#permissions
alias defaultpermissions 'find . -type d -print0 | xargs -0 chmod 0755 && find . -type f -print0 | xargs -0 chmod 0644'


# Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias ls 'eza --long --header --icons --group-directories-first'
alias l 'eza --long --all --header --git --icons --no-permissions --no-time --no-user --no-filesize --group-directories-first'
alias ll 'eza -lagh --git --icons --group-directories-first'
alias la 'eza -lagh --git --icons --group-directories-first --sort modified'
alias cll 'clear; and eza --long --all --header --git --icons --no-permissions --no-time --no-user --no-filesize --group-directories-first'

## Tree view
alias tree 'eza -Ta --icons --ignore-glob="node_modules|.git|.vscode|.DS_Store"'
alias ltd 'eza -TaD --icons --ignore-glob="node_modules|.git|.vscode|.DS_Store"'


# Project shortcuts/aliases
alias projects 'cd ~/Developer'
alias dev 'cd ~/Developer'
alias work 'cd ~/Developer/work'
alias dots 'cd ~/.dotfiles'

