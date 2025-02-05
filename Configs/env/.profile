
# Disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Make vim the default editor
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=code

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=100000000
export HISTCONTROL=erasedups

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=20


export HOMEBREW_CASK_OPTS="--appdir=/Applications"


export LD_LIBRARY_PATH=/opt/rocm/hsa:$LD_LIBRARY_PATH

export PATH=$PATH:/opt/rocm/hip/bin/
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

export GPG_TTY=$(tty)

export LANG="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"
export LC_CTYPE="de_DE.UTF-8"
export LC_MESSAGES="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_NUMERIC="de_DE.UTF-8"
export LC_TIME="de_DE.UTF-8"

export npm_config_prefix="$HOME/.local"
