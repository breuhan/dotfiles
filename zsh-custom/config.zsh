# Disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Enable colors in ls
DISABLE_LS_COLORS="false"

# Disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Make vim the default editor
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=20

