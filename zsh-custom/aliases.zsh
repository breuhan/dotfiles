alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias rcp='rsync -avP --progress'
alias rmv='rsync -avP --progress --remove-source-files'

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:/usr/local/texlive/2012basic/bin/x86_64-darwin
export PATH=$PATH:$HOME/Dropbox/Programmierung/bin

export PATH=/Developer/NVIDIA/CUDA-5.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.5/lib:$DYLD_LIBRARY_PATH

alias itunespush="rsync -avz --delete $HOME/Music/iTunes/ avoton.home.breuhan.de:'/export/tank/Audio/iTunes/'"
alias itunespull="rsync -avz --delete avoton.home.breuhan.de:'/export/tank/Audio/iTunes/' $HOME/Music/iTunes/"
alias iphotopush="rsync -avz --progress --delete --iconv=UTF-8-MAC,UTF-8 $HOME/Pictures/ avoton.home.breuhan.de:'/export/volatile/Andy/Bilder/'"
alias iphotopull="rsync -avz --delete avoton.home.breuhan.de:'/export/volatile/Andy/Bilder/' $HOME/Pictures/"
alias hidrivepush="rsync -avzhPy --inplace --delete --delete-excluded --exclude-from=/MiniDrive/Dateien/.rsync_exclude --iconv=UTF-8-MAC,UTF-8 /MiniDrive/Dateien/ cylonbrain@rsync.hidrive.strato.com:'/users/cylonbrain/Dateien/'"
alias hidrivepull="rsync -av --progress --delete --iconv=UTF-8-MAC,UTF-8 cylonbrain@rsync.hidrive.strato.com:'/users/cylonbrain/Dateien/' /MiniDrive/Dateien/"
alias dateienpush="rsync -avzhPy --inplace --delete --delete-excluded --exclude-from=/MiniDrive/Dateien/.rsync_exclude --iconv=UTF-8-MAC,UTF-8 /MiniDrive/Dateien/ avoton.home.breuhan.de:'/export/volatile/Andy/Dateien/'"

alias hawkthorne="cd Source/hawkthorne-journey/ && git pull && make && open build/hawkthorne.love && cd -"
alias sublime="open -a \"Sublime Text 2\""

alias gitgogo="git commit -m \"changes from $(uname -n) on $(date)\""
alias defaultpermissions="find . -type d -print0 | xargs -0 chmod 0755 && find . -type f -print0 | xargs -0 chmod 0644"
