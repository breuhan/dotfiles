# TODO: Fix strange locales on OSX
export LC_ALL=en_US.UTF-8 

# Enable awsenv if installed in the users home directory
if [ -d "$HOME/.awsenv/bin" ]; then
    export PATH="$HOME/.awsenv/bin:$PATH"
fi

# Update path to find all tools installed via homebrew
if [ -d /usr/locales/Cellar ]; then
    for dir in $(find /usr/local/Cellar -name 'bin'); do
        export PATH="$dir:$PATH"
    done
fi
