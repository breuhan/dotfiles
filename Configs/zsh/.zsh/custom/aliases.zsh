alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias rcp='rsync -avP --progress'
alias rmv='rsync -avP --progress --remove-source-files'
alias grep='grep --color'

# - Detect newer versions of ls is installed (e.g. "brew install coreutils")
# - Use "l" as short and "ll" as long version
which -a ls | grep gls > /dev/null
if [ $? -eq 0 ]; then
    alias l="ls -lh --color=auto"
    alias ll="ls -alh --color=auto"
else
    alias l="ls -lh -G"
    alias ll="ls -alh -G"
fi

alias dud='du --max-depth=1 -h'
alias duf='du -sh *'

alias gs="git status"
alias defaultpermissions="find . -type d -print0 | xargs -0 chmod 0755 && find . -type f -print0 | xargs -0 chmod 0644"
alias git-recursive-pull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'
