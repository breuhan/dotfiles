# This is required for OSX to properly find tools installed with homebrew
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi
echo "$PATH" | grep -q "/usr/local/bin"     && export PATH="/usr/local/bin:$PATH"
echo "$PATH" | grep -q "/usr/local/sbin"    && export PATH="/usr/local/sbin:$PATH"
echo "$PATH" | grep -q "/usr/local/git/bin" && export PATH="/usr/local/git/bin:$PATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
