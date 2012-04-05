# TODO: Fix strange locales on OSX
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# This is required for OSX to properly find tools installed with homebrew
echo "$PATH" | grep -q "/usr/local/bin"     && export PATH="/usr/local/bin:$PATH"
echo "$PATH" | grep -q "/usr/local/sbin"    && export PATH="/usr/local/sbin:$PATH"
echo "$PATH" | grep -q "/usr/local/git/bin" && export PATH="/usr/local/git/bin:$PATH"
