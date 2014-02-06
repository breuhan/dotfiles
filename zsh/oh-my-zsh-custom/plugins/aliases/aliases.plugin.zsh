# List all files colorized in long format
alias l="ls -lh"

# List all files colorized in long format, including dot files
alias ll="ls -lhA"

# List only directories
alias lsd='l | grep "^d"'

# Always use color output for `ls`
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Shortcuts
alias g="git"
alias j="jobs"
alias o="open"
alias oo="open ."
alias v="vim"

# Save one useless "q" ;)
alias less='less --quit-if-one-screen'

# Activate screen saver
alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

# Gzip-enabled `curl`
alias gurl="curl --compressed"

# Get week number
alias week='date +%V'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rf /Volumes/*/.Trashes; sudo rm -rf ~/.Trash; sudo rm -rf /private/var/log/asl/*.asl"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable/Enable Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Some git shortcuts
#
# hint: the second char (the one after the small "g" for git) is in UPPER CASE?
#       WARNING! you're dealing with the _dangerous_ version of the lower case
#       version. for example "ga" is quite safe but "gA" is not.
alias gc="git checkout"
alias gd="git diff"
alias gds="git diff --stat"
alias gD="git diff --cached"
alias gDs="git diff --cached --stat"
alias gs="git status --short --branch"

alias gm="git commit --verbose"
alias gM="git commit --message"
alias gmA="git commit --all --verbose"
alias gMA="git commit --all --message"

alias ga="git add --patch"
alias gA="git add --all"

alias gr="git reset"
alias gr1="git reset HEAD^"
alias gr2="git reset HEAD^^"
alias gR="git reset --hard"
alias gR1="git reset HEAD^ --hard"
alias gR2="git reset HEAD^^ --hard"

alias gl="git log --pretty=history --decorate --date=short --graph"
alias gL="gl --patch"
# addition to be compatible with the filesystem "l" and "ll"
alias gll="gL"

alias gss="git stash save --include-untracked"
alias gsl="git stash list"
alias gsa="git stash apply"
alias gsA="git stash pop"

alias gu="git pull && [ -f .gitfat ] && git fat pull"
alias gU="git pull --no-rebase && [ -f .gitfat ] && git fat pull"

alias gp="git push"
alias gP="git push --all && git push --tags && [ -f .gitfat ] && git fat push"
