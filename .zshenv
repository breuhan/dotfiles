# TODO: Fix strange locales on OSX
export LC_ALL=en_US.UTF-8

# This is required for OSX to properly find tools installed with homebrew
echo "$PATH" | grep -q "/usr/local/bin"  && export PATH="/usr/local/bin:$PATH"
echo "$PATH" | grep -q "/usr/local/sbin" && export PATH="/usr/local/sbin:$PATH"

# Enable awsenv if installed in the users home directory
if [ -d "$HOME/.awsenv/bin" ]; then
    export PATH="$HOME/.awsenv/bin:$PATH"
fi
