export PATH=~/.homebrew/bin:~/.homebrew/sbin:$PATH
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:/usr/local/texlive/2012basic/bin/x86_64-darwin
export PATH=$PATH:/Users/andybreuhan/Dropbox/Programmierung/bin
export PATH=$PATH:$HOME/omnetpp-4.3/bin
export PATH=$PATH:$HOME/Source/omnetpp-4.3/bin

export PATH=/Developer/NVIDIA/CUDA-5.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.5/lib:$DYLD_LIBRARY_PATH

alias itunespush="rsync -avz --delete /Volumes/Daten/Music/iTunes/ macmini.home.breuhan.de:'/Volumes/Time\ Machine/iTunes/'"
alias itunespull="rsync -avz --delete macmini.home.breuhan.de:'/Volumes/Time\ Machine/iTunes/' /Volumes/Daten/Music/iTunes/"
alias iphotopush="rsync -avz --delete /Users/andybreuhan/Pictures/Bibliothek\ iPhoto/ macmini.home.breuhan.de:'/Volumes/tank/Andy/Bibliothek\ iPhoto/'"
alias iphotopull="rsync -avz --delete macmini.home.breuhan.de:'/Volumes/tank/Andy/Bibliothek\ iPhoto/' /Users/andybreuhan/Pictures/Bibliothek\ iPhoto/ "
alias hidrivepush="rsync -avzhPy --inplace --delete --delete-excluded --exclude-from=/Volumes/MiniDrive/Dateien/.rsync_exclude --iconv=UTF-8-MAC,UTF-8 /Volumes/MiniDrive/Dateien/ cylonbrain@rsync.hidrive.strato.com:'/users/cylonbrain/Dateien/'"
alias hidrivepull="rsync -av --progress --delete --iconv=UTF-8-MAC,UTF-8 cylonbrain@rsync.hidrive.strato.com:'/users/cylonbrain/Dateien/' /Volumes/MiniDrive/Dateien/"
alias dateienpush="rsync -avzhPy --inplace --delete --delete-excluded --exclude-from=/Volumes/MiniDrive/Dateien/.rsync_exclude /Volumes/MiniDrive/Dateien/ macmini.home.breuhan.de:'/Volumes/tank/Andy/Dateien/'"

alias hawkthorne="cd Source/hawkthorne-journey/ && git pull && make && open build/hawkthorne.love && cd -"
alias sublime="open -a \"Sublime Text 2\""

ulimit -n 1024
HISTSIZE=10000
export HISTCONTROL=erasedups

