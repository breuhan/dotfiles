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

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:/usr/local/texlive/2012basic/bin/x86_64-darwin
export PATH=$PATH:$HOME/Dropbox/Programmierung/bin
export PATH=$PATH:$HOME/bin

export PATH=/Developer/NVIDIA/CUDA-7.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.5/lib/:$DYLD_LIBRARY_PATH

alias itunespush="rsync -avz --delete $HOME/Music/iTunes/ avoton.home.breuhan.de:'/export/tank/Audio/iTunes/'"
alias itunespull="rsync -avz --delete avoton.home.breuhan.de:'/export/tank/Audio/iTunes/' $HOME/Music/iTunes/"
alias iphotopush="rsync -avz --progress --delete --iconv=UTF-8-MAC,UTF-8 $HOME/Pictures/ avoton.home.breuhan.de:'/export/volatile/Andy/Bilder/'"
alias iphotopull="rsync -avz --delete avoton.home.breuhan.de:'/export/volatile/Andy/Bilder/' $HOME/Pictures/"
alias hidrivepush="rsync -avzhPy --inplace --delete --delete-excluded --exclude-from=/Volumes/MiniDrive/Dateien/.rsync_exclude --iconv=UTF-8-MAC,UTF-8 /Volumes/MiniDrive/Dateien/ cylonbrain@rsync.hidrive.strato.com:'/users/cylonbrain/Dateien/'"
alias hidrivepull="rsync -av --progress --delete --iconv=UTF-8-MAC,UTF-8 cylonbrain@rsync.hidrive.strato.com:'/users/cylonbrain/Dateien/' /Volumes/MiniDrive/Dateien/"
alias dateienpull="rsync -avzhPy --inplace --delete --delete-excluded --exclude-from=/Volumes/MiniDrive/Dateien/.rsync_exclude  avoton.home.breuhan.de:'/export/volatile/Andy/Dateien/'" /Volumes/MiniDrive/Dateien/

alias hawkthorne="cd Source/hawkthorne-journey/ && git pull && make && open build/hawkthorne.love && cd -"
alias sublime="open -a \"Sublime Text 2\""

alias gitgogo="git commit -m \"changes from $(uname -n) on $(date)\""
alias gs="git status"
alias defaultpermissions="find . -type d -print0 | xargs -0 chmod 0755 && find . -type f -print0 | xargs -0 chmod 0644"
alias git-recursive-pull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'
